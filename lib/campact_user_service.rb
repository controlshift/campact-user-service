require 'campact_user_service/client'
require 'campact_user_service/session'
require 'campact_user_service/account'

module CampactUserService
  class << self
    def session(session_id, session_cookie_name, options)
      client = CampactUserService::Client.new(options)
      CampactUserService::Session.new(client, session_id, session_cookie_name)
    end

    def account(external_account_id, options)
      client = CampactUserService::Client.new(options)
      CampactUserService::Account.new(client, external_account_id)
    end
  end
end
