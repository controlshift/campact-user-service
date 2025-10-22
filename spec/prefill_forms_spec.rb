require 'spec_helper'

describe CampactUserService::PrefillForms do
  let(:client) { CampactUserService::Client.new(host: 'test.com') }
  let(:account_id) { 'abcdef123456fedcba' }

  subject do
    CampactUserService::PrefillForms.new(client, account_id)
  end

  before(:each) do
    WebMock.disable_net_connect!
  end

  describe '#update_prefill_forms' do
    it 'should update the prefill forms state with just the state and petition slug' do
      stub_patch_prefill_forms = stub_request(:patch, "https://test.com/v1/prefill_forms?account_id=#{account_id}")
        .with(body: {
          prefill_forms: {
            state: 'allowed',
            slug: 'save-the-forest'
          }
        })
        .to_return(status: 204)

      subject.update_prefill_forms(prefill_forms_state: 'allowed', campaign_slug: 'save-the-forest')

      assert_requested(stub_patch_prefill_forms)
    end

    it 'should update the prefill forms state including UTM parameters' do
      utm_params = {
        utm_campaign: 'a campaign',
        utm_content: 'a content',
        utm_medium: 'a medium',
        utm_source: 'a source',
        utm_term: 'a term',
        utm_placement: 'a placement',
        utm_target: 'a target'
      }
      stub_patch_prefill_forms = stub_request(:patch, "https://test.com/v1/prefill_forms?account_id=#{account_id}")
        .with(body: {
          prefill_forms: {
            state: 'allowed',
            slug: 'save-the-forest'
          }.merge(utm_params)
        })
        .to_return(status: 204)

      subject.update_prefill_forms(prefill_forms_state: 'allowed', campaign_slug: 'save-the-forest', **utm_params)

      assert_requested(stub_patch_prefill_forms)
    end
  end
end
