# frozen_string_literal: true

module Integra365

  # Generic error to be able to rescue all Integra365 errors
  class Integra365Error < StandardError; end

  # Raised when Integra365 not configured correctly
  class ConfigurationError < Integra365Error; end

  # Error when authentication fails
  class AuthenticationError < Integra365Error; end
end
