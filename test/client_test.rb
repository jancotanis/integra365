require 'dotenv'
require 'logger'
require "test_helper"

CLIENT_LOGGER = "client_test.log"
File.delete(CLIENT_LOGGER) if File.exist?(CLIENT_LOGGER)


describe 'client' do
  before do
    Dotenv.load
    Integra365.configure do |config|
      config.username = ENV["INTEGRA365_USER"]
      config.password = ENV["INTEGRA365_PASSWORD"]
      config.logger   = Logger.new(CLIENT_LOGGER)
    end
    @client = Integra365.client()
    @client.login
  end

  it "#1 GET /V1/Tenants" do
    tenants = @client.tenants

    assert tenants.count > 0, ".count > 0" 
    refute tenants.first.friendlyName.empty?, ".friendlyName.empty?"

    template = {
      "id": "string", 
      "vboServerId": "string", 
      "storageSubscriptionModelId": "string", 
      "resellerId": "string", 
      "enforcedProfileSettingsId": nil, 
      "tenantName": "string", 
      "friendlyName": "string", 
      "accountingReference": nil, 
      "customProperties": nil
    }
    respond_to_template(template, tenants.first, "tenant")
    
    id = tenants.first.id
    tenant = @client.tenant(id)
    assert value(tenant.friendlyName).must_equal tenants.first.friendlyName, "check tenant by id for equal friendlyName"

    # not sure about the data, should not crash
    licenses = @client.tenant_licenses(id)
    storage  = @client.tenant_storage(id)
  end
  it "#1 GET /V1/backupJobReporting" do
    bjr = @client.backup_job_reporting
    assert bjr.count > 0, ".count > 0" 
  end
end
