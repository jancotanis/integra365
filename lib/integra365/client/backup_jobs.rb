# frozen_string_literal: true

module Integra365
  class Client
    # Defines methods related to backup job reporting
    # @see https://api.integra-bcs.nl/swagger/index.html
    module BackupJobs
      # Get all backupjobs
      def backup_jobs
        get('BackupJobs')
      end

      # Get backupjob by id
      def backup_job(id)
        get("BackupJobs/#{id}")
      end

      # Get backupjob state as string
      def backup_job_state(id)
        get("BackupJobs/#{id}/State")
      end

      # Get backupjob sessions
      def backup_job_sessions(id)
        get("BackupJobs/#{id}/Sessions")
      end
    end
  end
end
