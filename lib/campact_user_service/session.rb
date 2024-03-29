module CampactUserService
  class Session
    attr_reader :client, :session_cookie_name, :session_id

    def initialize(client, session_id, session_cookie_name)
      @client = client
      @session_id = session_id
      @session_cookie_name = session_cookie_name
    end

    def external_account_id
      session["external_account_id"]
    end

    def has_soft_login_session?
      session["permission_level"] == 'limited'
    end

    def has_hard_login_session?
      session["permission_level"] == 'full'
    end

    def destroy
      client.delete_request('/v1/sessions', cookies: {session_cookie_name => session_id})
    end

    private

    def session
      @session_info ||= (client.get_request('/v1/sessions', cookies: {session_cookie_name => session_id}) || {})
    end
  end
end
