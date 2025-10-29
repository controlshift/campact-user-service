require 'campact_user_service/client'
require 'campact_user_service/session'
require 'campact_user_service/account'
require 'campact_user_service/prefill_forms'

module CampactUserService
  class << self
    def session(session_id, session_cookie_name, options)
      client = CampactUserService::Client.new(options)
      CampactUserService::Session.new(client, session_id, session_cookie_name)
    end

    def account(account_id, options)
      client = CampactUserService::Client.new(options)
      CampactUserService::Account.new(client, account_id)
    end

    def prefill_forms(account_id, options)
      client = CampactUserService::Client.new(options)
      CampactUserService::PrefillForms.new(client, account_id)
    end
  end
end
