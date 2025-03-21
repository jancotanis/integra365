# Integra Office365 backup API

[![Version](https://img.shields.io/gem/v/integra365.svg)](https://rubygems.org/gems/integra365)
[![Maintainability](https://api.codeclimate.com/v1/badges/41dec06ba5200b40b44e/maintainability)](https://codeclimate.com/github/jancotanis/integra365/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/41dec06ba5200b40b44e/test_coverage)](https://codeclimate.com/github/jancotanis/integra365/test_coverage)

This is a wrapper for the Integra Office365 backup API.
You can see the [API endpoints](https://api.integra-bcs.nl/swagger/index.html).

Currently only the GET requests to get a list of tenants and backup job reports
are implemented.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'integra365'
```

And then execute:

```console
> bundle install
```

Or install it yourself as:

```console
> gem install integra365
```

## Usage

Before you start making the requests to API provide the client id and client secret and
email/password using the configuration wrapping.

```ruby
require 'integra365'

Integra365.configure do |config|
  config.username = ENV["INTEGRA365_USER"]
  config.password = ENV["INTEGRA365_PASSWORD"]
end

client = Integra365.client
client.login

tenants = client.tenants
tenants.each do |t|
  puts "#{t.friendlyName} - #{t.tenantName}"
end
```

## Resources

### Authentication

```ruby
# setup configuration
#
client.login
```

|Resource|API endpoint|Description|
|:--|:--|:--|
|.token or .login|/Api/V1/Token|portal user|
|.token_refresh|/Api/V1/Token/Refresh|Refresh authentication token|

### Tenant

Endpoint for tenant related requests

```ruby
licenses = client.tenant_licenses
```

|Resource|API endpoint|
|:--|:--|
|.tenants|/Api/V1/Tenants/{id}|
|.get_tenant_by_id(id) .tenant(id)|/Api/V1/Tenants/{id}|
|.tenant_licenses(id) |/Api/V1/Tenants/{id}/Licenses|
|.tenant_storage(id)|/Api/V1/Tenants/{id}/Storage|

### BackupJobs

Get list of backup jobs or by id and state

|Resource|API endpoint|
|:--|:--|
|.backup_jobs|/Api/V1/BackupJobs|
|.backup_job(id) .tenant(id)|/Api/V1/BackupJobs/{id}|
|.backup_job_state(id)|/Api/V1/BackupJobs/{id}/State|
|.backup_job_sessions(id)|/Api/V1/BackupJobs/{id}/Sessions|

### BackupJobReporting

BackupJobReporting for status of backup jobs

```ruby
job_statuses = client.backup_job_reporting

```

|Resource|API endpoint|
|:--|:--|
|.backup_job_reporting|/Api/V1/BackupJobReporting|

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/jancotanis/integra365).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
