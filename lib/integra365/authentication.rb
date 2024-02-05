
module Integra365
  # Deals with authentication flow and stores it within global configuration
  module Authentication
    # Authorize to the Integra365 portal and return access_token
    def token(options = {})
      api_auth("Token", options)
    end
    alias login token

    # Return an access token from authorization
    # token currrent token
    def token_refresh(token)
      api_refresh("Token/Refresh", token)
    end
  end
end
