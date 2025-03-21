# frozen_string_literal: true

require 'logger'
require 'test_helper'

AUTH_LOGGER = 'auth_test.log'
File.delete(AUTH_LOGGER) if File.exist?(AUTH_LOGGER)

describe 'auth' do
  before do
    Integra365.reset
  end
  it '#1 not logged in' do
    client = Integra365.client({ logger: Logger.new(AUTH_LOGGER) })
    assert_raises Integra365::ConfigurationError do
      client.login
    end
  end

  it '#2 logged in' do
    Integra365.configure do |config|
      config.username = ENV['INTEGRA365_USER']
      config.password = ENV['INTEGRA365_PASSWORD']
    end
    client = Integra365.client({ logger: Logger.new(AUTH_LOGGER) })
    refute_empty client.login, '.login'
    rtoken = client.refresh_token
    client.token_refresh(client.refresh_token)
    assert rtoken != client.refresh_token, 'new refresh token'
  end

  it '#3 wrong credentials' do
    Integra365.configure do |config|
      config.username = 'john'
      config.password = 'doe'
    end
    client = Integra365.client({ logger: Logger.new(AUTH_LOGGER) })
    assert_raises Integra365::AuthenticationError do
      client.login
    end
  end
end
