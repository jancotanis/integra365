# frozen_string_literal: true

module Integra365
  class Client
    # Defines methods related to tenants
    # @see https://api.integra-bcs.nl/swagger/index.html
    module Tenants
      # Get all tenants
      def tenants(id = nil)
        if id
          get("Tenants/#{id}")
        else
          get('Tenants')
        end
      end

      # Get tenant by id
      def tenant(id)
        tenants(id)
      end
      alias get_tenant_by_id tenant

      # Get license consumption history for a tenant
      #
      # @see https://api.integra-bcs.nl/swagger/index.html#operations-Tenants-get_Api_V1_Tenants__id__Licenses
      def tenant_licenses(id)
        get("Tenants/#{id}/Licenses")
      end

      # Get storage consumption history for a tenant
      #
      # @see https://api.integra-bcs.nl/swagger/index.html
      def tenant_storage(id)
        get("Tenants/#{id}/Storage")
      end
    end
  end
end
