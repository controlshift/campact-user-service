$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')

require 'campact_user_service'
require 'faraday/detailed_logger'

service_host = ENV['SERVICE_HOST'] || 'weact-adapter.staging.campact.de'

def instrument_connection_with_extended_logging(client)
  default_options = {
    ssl: { verify: false },
    headers: {
      'Accept' => "application/json;q=0.1",
      'Accept-Charset' => "utf-8",
      'User-Agent' => 'campact_user_service'
    }
  }

  faraday_builder = ->(faraday) do
    faraday.response :detailed_logger
    faraday.adapter Faraday.default_adapter
  end

  instrumented_connection = Faraday.new(
    "https://#{client.host}",
    default_options,
    &faraday_builder
  )
  client.instance_variable_set(:@connection, instrumented_connection)
end

# Pick which API to connect to
# 1 for session
# 2 for user
# 3 for prefill forms
puts "Which user service are you going to use?\n\t1) session\n\t2) user\n\t3) prefill forms"
option = gets.chomp

# Get TOTP credentials
username = if ENV['TOTP_USER'].nil?
  puts "I'll need your API credentials"
  puts "Enter your TOTP user"
  gets.chomp
else
  ENV['TOTP_USER']
end

secret = if ENV['TOTP_SECRET'].nil?
  puts "Enter your TOTP secret"
  gets.chomp
else
  ENV['TOTP_SECRET']
end

# Now connect to the right API
user_service = case option
when '1'
  puts "Now I'll need a session token"
  token = gets.chomp
  session = CampactUserService.session(
    token,
    'campact-staging-session',
    {
      host: service_host,
      topt_authorization: {user: username, secret: secret}
    }
  )
when '2'
  puts "I'll need a user account ID. In practice I won't need this here because it can be derived through the session token"
  account_id = gets.chomp
  account = CampactUserService.account(
    account_id,
    {
      host: service_host,
      topt_authorization: {user: username, secret: secret}
    }
  )
when '3'
  puts "I'll need a user account ID. In practice I won't need this here because it can be derived through the session token"
  account_id = gets.chomp
  prefill_forms = CampactUserService.prefill_forms(account_id, {
      host: service_host,
      topt_authorization: {user: username, secret: secret}
    }
  )
else
  raise 'Invalid option'
end

instrument_connection_with_extended_logging(user_service.client)

puts "Waiting for your command..."
require 'pry-byebug'
binding.pry # rubocop:disable Lint/Debugger

puts 'Goodbye!'
