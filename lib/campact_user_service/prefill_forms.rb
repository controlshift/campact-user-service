module CampactUserService
  class PrefillForms
    attr_reader :client, :account_id

    def initialize(client, account_id)
      @client = client
      @account_id = account_id
    end

    def update_prefill_forms(prefill_forms_state:, campaign_slug:, **additional_params)
      params = {
        prefill_forms: {
          state: prefill_forms_state,
          slug: campaign_slug
        }.merge(additional_params)
      }

      path = "/v1/prefill_forms?account_id=#{account_id}"
      client.patch_request(path, body: params)
    end
  end
end
