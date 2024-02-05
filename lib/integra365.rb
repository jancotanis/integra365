require "wrapi"
require File.expand_path('integra365/api', __dir__)
require File.expand_path('integra365/client', __dir__)
require File.expand_path('integra365/version', __dir__)

module Integra365
  extend WrAPI::Configuration
  extend WrAPI::RespondTo

  # Alias for Integra365::Client.new
  #
  # @return [Integra365::Client]
  def self.client(options = {})
    Integra365::Client.new({
      endpoint: 'https://api.integra-bcs.nl/Api/V1/'.freeze,
      user_agent: "Integra365 Ruby API wrapper #{Integra365::VERSION}".freeze
    }.merge(options))
  end
end
