require 'dotenv'
require 'logger'
require "test_helper"

AUTH_LOGGER = "auth_test.log"
File.delete(AUTH_LOGGER) if File.exist?(AUTH_LOGGER)

describe 'auth' do
  before do
    Dotenv.load
    Integra365.reset
  end
  it "#1 not logged in" do
    c = Integra365.client({ logger: Logger.new(AUTH_LOGGER) })
    assert_raises Integra365::ConfigurationError do
      c.login
    end
  end
  it "#2 logged in" do

    Integra365.configure do |config|
      config.username = ENV["INTEGRA365_USER"]
      config.password = ENV["INTEGRA365_PASSWORD"]
    end
    c = Integra365.client({ logger: Logger.new(AUTH_LOGGER) })
    refute_empty c.login, ".login"
    a = c.access_token
    r = c.refresh_token

    c.token_refresh(c.refresh_token)
    assert a != c.access_token, "new access token"
    assert r != c.refresh_token, "new refresh token"
  end
  it "#3 wrong credentials" do
    Integra365.configure do |config|
      config.username = "john"
      config.password = "doe"
    end
    c = Integra365.client({ logger: Logger.new(AUTH_LOGGER) })
    assert_raises Integra365::AuthenticationError do
      c.login
    end
  end
end
