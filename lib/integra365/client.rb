# frozen_string_literal: true

module Integra365
  # Wrapper for the Integra365 REST API
  #
  # @note All methods have been separated into modules and follow the same grouping used in api docs
  # @see https://api.integra-bcs.nl/swagger/index.html
  class Client < API
    Dir[File.expand_path('client/*.rb', __dir__)].each { |f| require f }

    include Integra365::Client::Tenants
    include Integra365::Client::BackupJobs
    include Integra365::Client::BackupJobReporting
  end
end
