require 'faraday'
require 'json'
require 'campact_user_service/response_error'

module CampactUserService
  class Client
    TIMEOUT = 60.freeze
    OPEN_TIMEOUT = 20.freeze

    attr_reader :connection, :host, :port, :basic_auth

    def initialize(options)
      @host = options.fetch(:host)
      @port = options[:port]
      @basic_auth = options[:basic_auth]
      faraday_options = default_faraday_options.merge(options.delete(:faraday) || {})
      adapter = faraday_options.delete(:adapter) || Faraday.default_adapter

      @connection = Faraday.new(endpoint, faraday_options) do |faraday|
        faraday.adapter adapter
        faraday.request :json
        faraday.request :authorization, :basic, basic_auth[:user], basic_auth[:password] if basic_auth
      end
    end

    %i(get delete patch).each do |verb|
      define_method("#{verb}_request") do |path, options={}|
        request(verb, path, options)
      end
    end

    private

    def request(verb, path, options)
      response = connection.send(verb.to_sym) do |req|
        req.url path
        req.options.timeout = TIMEOUT
        req.options.open_timeout = OPEN_TIMEOUT
        if options.key?(:cookies)
          req.headers['Cookie'] = format_cookies(options[:cookies])
        end

        if options.key?(:body)
          req.body = options[:body]
        end

      end

      case response.status
      when 200
        body = (response.body.nil? || response.body == '') ? '{ }' : response.body
        JSON.parse(body)
      when 201..299
        true
      when 404
        nil
      when 300..599
        raise ResponseError.new(response.status, response.body)
      else
        nil
      end
    end

    def default_faraday_options
      {
        ssl: { verify: true },
        headers: {
          'Accept' => "application/json;q=0.1",
          'Accept-Charset' => "utf-8",
          'User-Agent' => 'campact_user_service'
        }
      }
    end

    def endpoint
      endpoint = "https://#{host}"
      if !port.nil?
        endpoint << ":#{port}"
      end

      endpoint
    end

    def format_cookies(cookies)
      case cookies
        when String
          cookies
        when Hash
          cookies.map {|k,v| "#{k}=#{v};" }.join
      end
    end

  end
end
