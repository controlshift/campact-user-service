require 'spec_helper'

describe CampactUserService::Session do
  let(:client) { CampactUserService::Client.new(host: 'test.com') }
  let(:session_id) { '123456abcdef' }
  let(:session_cookie_name) { 'cus-session' }

  subject { CampactUserService::Session.new(client, session_id, session_cookie_name) }

  describe '#external_account_id' do
    it 'should be present' do
      stub_request(:get, 'https://test.com/v1/sessions')
        .with(headers: {'Cookie' => "cus-session=#{session_id};"})
        .to_return(body: {external_account_id: '189b6864-d58a-4f49-8370-4ae0b854a40e'}.to_json)

      expect(subject.external_account_id).to eq('189b6864-d58a-4f49-8370-4ae0b854a40e')
    end
  end

  describe '#has_soft_login_session?' do
    it 'should be true where permission level is limited' do
      stub_request(:get, 'https://test.com/v1/sessions')
        .with(headers: {'Cookie' => "cus-session=#{session_id};"})
        .to_return(body: {permission_level: 'limited'}.to_json)

      expect(subject.has_soft_login_session?).to be_truthy
    end

    it 'should be false where permission level is full' do
      stub_request(:get, 'https://test.com/v1/sessions')
        .with(headers: {'Cookie' => "cus-session=#{session_id};"})
        .to_return(body: {permission_level: 'full'}.to_json)

      expect(subject.has_soft_login_session?).to be_falsey
    end
  end

  describe '#has_hard_login_session?' do
    it 'should be true where permission level is full' do
      stub_request(:get, 'https://test.com/v1/sessions')
        .with(headers: {'Cookie' => "cus-session=#{session_id};"})
        .to_return(body: {permission_level: 'full'}.to_json)

      expect(subject.has_hard_login_session?).to be_truthy
    end

    it 'should be false where permission level is limited' do
      stub_request(:get, 'https://test.com/v1/sessions')
        .with(headers: {'Cookie' => "cus-session=#{session_id};"})
        .to_return(body: {permission_level: 'limited'}.to_json)

      expect(subject.has_hard_login_session?).to be_falsey
    end
  end

  describe '#destroy' do
    it 'should perform DELETE request' do
      stub_request(:delete, 'https://test.com/v1/sessions')
        .with(headers: {'Cookie' => "cus-session=#{session_id};"})
        .to_return(body: '', status: 204)

      expect(subject.destroy).to be_truthy
    end
  end
end
