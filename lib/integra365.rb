require "wrapi"
require File.expand_path('integra365/api', __dir__)
require File.expand_path('integra365/client', __dir__)
require File.expand_path('integra365/version', __dir__)

module Integra365
  extend WrAPI::Configuration
  extend WrAPI::RespondTo

  DEFAULT_ENDPOINT = 'https://api.integra-bcs.nl/Api/V1/'.freeze
  DEFAULT_UA       = "Integra365 Ruby API wrapper #{Integra365::VERSION}".freeze

  # Alias for Integra365::Client.new
  #
  # @return [Integra365::Client]
  def self.client(options = {})
    Integra365::Client.new({
      endpoint: DEFAULT_ENDPOINT,
      user_agent: DEFAULT_UA
    }.merge(options))
  end

  def self.reset
    super
    self.endpoint = DEFAULT_ENDPOINT
    self.user_agent = DEFAULT_UA
  end
end
