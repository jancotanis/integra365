# frozen_string_literal: true

require File.expand_path('error', __dir__)

module Integra365
  # Deals with authentication flow and stores it within global configuration
  module Authentication
    # Authorize to the Integra365 portal and return access_token
    def token(options = {})
      raise ConfigurationError.new 'Client id and/or secret not configured' unless self.username && self.password

      api_auth('Token', options)
    rescue Faraday::BadRequestError, Faraday::UnauthorizedError => e
      raise AuthenticationError.new 'Unauthorized; response ' + e.to_s
    end
    alias login token

    # Return an access token from authorization
    # token currrent token
    def token_refresh(token)
      api_refresh('Token/Refresh', token)
    rescue Faraday::BadRequestError, Faraday::UnauthorizedError => e
      raise AuthenticationError.new 'Unauthorized; response #{e}'
    end
  end
end
