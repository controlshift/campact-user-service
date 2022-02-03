require 'spec_helper'

describe CampactUserService do
  subject { CampactUserService }

  describe '.session' do
    it 'should create Session instance with correct arguments' do
      options = { foo: 'bar', foo2: 'bar2' }
      client = double
      expect(CampactUserService::Client).to receive(:new).with(options).and_return(client)
      session_id = '123abcd'
      session_cookie_name = 'campact-session'
      session_api = double
      expect(CampactUserService::Session).to receive(:new).with(client, session_id, session_cookie_name).and_return(session_api)

      session = subject.session(session_id, session_cookie_name, options)

      expect(session).to be(session_api)
    end
  end

  describe '.account' do
    it 'should create Account instance with correct arguments' do
      options = { foo: 'bar', foo2: 'bar2' }
      client = double
      expect(CampactUserService::Client).to receive(:new).with(options).and_return(client)
      external_account_id = '189b6864-d58a-4f49-8370-4ae0b854a40e'
      account_api = double
      expect(CampactUserService::Account).to receive(:new).with(client, external_account_id).and_return(account_api)

      account = subject.account(external_account_id, options)

      expect(account).to be(account_api)
    end
  end
end
