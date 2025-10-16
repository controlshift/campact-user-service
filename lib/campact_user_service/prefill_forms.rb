module CampactUserService
  class PrefillForms
    attr_reader :client, :account_id

    def initialize(client, account_id)
      @client = client
      @account_id = account_id
    end

    def update_prefill_forms(prefill_forms_state:, petition_slug:, **additional_params)
      params = {
        state: prefill_forms_state,
        slug: petition_slug
      }
      params.merge!(additional_params)

      client.patch_request("/v1/prefill_forms/#{account_id}", body: {
        prefill_forms: params
      })
    end
  end
end
