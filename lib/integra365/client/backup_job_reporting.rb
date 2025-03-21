# frozen_string_literal: true

module Integra365
  class Client
    # Defines methods related to backup job reporting
    # @see https://api.integra-bcs.nl/swagger/index.html
    module BackupJobReporting
      # Get all backupjob reports
      def backup_job_reporting
        get('BackupJobReporting')
      end
    end
  end
end
