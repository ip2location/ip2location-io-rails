[![Gem Version](https://img.shields.io/gem/v/ip2location_io_rails.svg)](https://rubygems.org/gems/ip2location_io_rails)
[![Gem Downloads](https://img.shields.io/gem/dt/ip2location_io_rails.svg)](https://rubygems.org/gems/ip2location_io_rails)

# IP2Location.io Ruby on Rails Library

Integrate the [IP2Location.io IP Geolocation API](https://www.ip2location.io/) into Ruby on Rails applications. Look up IPv4 and IPv6 addresses to retrieve available geolocation, ASN, network, and proxy intelligence using a simple Rails wrapper around the `ip2location_io_ruby` gem.

## Features

- **IPv4 and IPv6 lookup:** Query either address format.
- **Geolocation:** Access country, region, city, coordinates, time zone, and other available location data.
- **Network intelligence:** Retrieve ASN, ISP, domain, and related network information where available.
- **Proxy intelligence:** Access proxy-related data included in your API plan.
- **Rails integration:** Configure your API key once and call the lookup from controllers or application code.

> Available fields depend on your [IP2Location.io subscription plan](https://www.ip2location.io/pricing). IP geolocation is approximate, not GPS positioning.

## Requirements

- Ruby **2.5 or later** (as declared by the gemspec).
- A Ruby on Rails application.
- An [IP2Location.io API key](https://www.ip2location.io/pricing) (free keys are available).

## Installation

Add the following gems to your Rails application's `Gemfile`:

```ruby
gem 'ip2location_io_ruby'
gem 'ip2location_io_rails'
```

Then install dependencies:

```bash
bundle install
```

### Configure the API key

Set `IP2LOCATION_API_KEY` in your application's environment or secret manager. For example, in `config/application.rb`, inside your application class:

```ruby
config.ip2location_io_key = ENV.fetch('IP2LOCATION_API_KEY')
```

Alternatively, set the same configuration in a specific file under `config/environments/` within the `Rails.application.configure do` block.

**Security:** Do not commit real API keys to source control. `ENV.fetch` raises an error during app startup when the key is missing, making misconfiguration easier to identify.

## Quick Start

Create a controller:

```bash
bin/rails generate controller Test index --skip-routes
```

Update `app/controllers/test_controller.rb`:

```ruby
require 'ip2location_io_rails'

class TestController < ApplicationController
  def index
    lookup = Ip2locationIORails.new('8.8.8.8')
    @location = lookup.location.body
  end
end
```

Add a route in `config/routes.rb`:

```ruby
get '/test', to: 'test#index'
```

Display the result in `app/views/test/index.html.erb`:

```erb
<h1>IP2Location.io lookup</h1>
<pre><%= @location %></pre>
```

Start the Rails server:

```bash
bin/rails server
```

Open `http://localhost:3000/test` to see the API response for `8.8.8.8`.

## More Usage Examples

### Look up a visitor's IP address

In a controller, replace the sample IP with the Rails request IP:

```ruby
lookup = Ip2locationIORails.new(request.remote_ip)
@location = lookup.location.body
```

**Important:** `request.remote_ip` depends on correct trusted-proxy configuration when your application runs behind a reverse proxy, load balancer, or CDN. Do not blindly trust client-supplied forwarding headers.

### Access the underlying response

The wrapper returns the underlying Ruby SDK lookup response through `location`:

```ruby
lookup = Ip2locationIORails.new('1.1.1.1')
response = lookup.location
body = response.body
```

For response structure and detailed fields, refer to the [IP2Location.io API documentation](https://www.ip2location.io/ip2location-documentation).

## Library Reference

| Interface | Description |
|---|---|
| `Ip2locationIORails.new(ip_address)` | Performs an IP geolocation lookup during initialization. |
| `lookup.location` | Returns the underlying `ip2location_io_ruby` SDK response. |
| `lookup.location.body` | Returns the response body, as shown in the original repository example. |
| `config.ip2location_io_key` | Rails configuration used for API authentication. |

This Rails library provides a minimal wrapper for IP geolocation lookup. It does **not** define separate Rails-specific methods for bulk lookup, WHOIS, or Hosted Domain lookup.

## Understanding ASN Lookup

An **Autonomous System Number (ASN)** identifies an autonomous network under a common routing policy. ASN information can help developers investigate traffic sources, identify network operators, and analyze hosting or ISP networks.

When included in your API response and subscription plan, ASN and associated network fields are accessible through the same IP lookup shown above. For offline ASN data, see the [IP2Location LITE databases](https://www.ip2location.com/database/lite).

## Common Use Cases

- **Content localization:** Adapt experiences based on approximate user location.
- **Analytics:** Analyze visits by geography, ISP, or network.
- **Network troubleshooting:** Investigate IP ownership and autonomous systems.
- **Security review:** Combine available proxy intelligence with other signals for risk assessment.

## Troubleshooting

| Problem | What to check |
|---|---|
| API key missing | Confirm `IP2LOCATION_API_KEY` is set and Rails has been restarted. |
| Authentication or quota errors | Check the API key, credits, and subscription at [IP2Location.io](https://www.ip2location.io/pricing). |
| Missing response fields | Some data is plan-dependent or not available for every IP. |
| Unexpected visitor IP | Check Rails trusted proxies and your CDN/load balancer setup. |
| `LoadError` or gem missing | Confirm both gems are in the `Gemfile` and run `bundle install`. |

## Frequently Asked Questions

**Does the library support IPv6?**  
Yes. Both IPv4 and IPv6 lookups are supported.

**Do I need an API key?**  
Yes. The Rails wrapper reads `config.ip2location_io_key`. You can obtain a free API key from [IP2Location.io](https://www.ip2location.io/pricing).

**Can I use it to determine a user's exact position?**  
No. IP geolocation estimates a network's location; it does not provide a device's GPS coordinates or an exact street address.

**Can I use it for proxy or fraud decisions?**  
Proxy signals can assist investigations, but they should not be treated as conclusive proof of fraud or abuse.

## Related IP2Location Products

| Product | Purpose |
|---|---|
| [IP2Location.io](https://www.ip2location.io/) | Hosted IP geolocation, ASN, and network intelligence APIs. |
| [IP2Location LITE](https://www.ip2location.com/database/lite) | Free downloadable IP geolocation and ASN databases for offline use. |
| [IP2Location Database](https://www.ip2location.com/database/ip2location) | Commercial offline IP geolocation databases. |
| [IP2Proxy](https://www.ip2location.com/database/proxy) | IP proxy, VPN, TOR and anonymizer intelligence. |
| [IP2WHOIS](https://www.ip2whois.com/) | Domain WHOIS lookup services. |

## Support

- [Report an issue](https://github.com/ip2location/ip2location-io-rails/issues)
- [IP2Location.io API documentation](https://www.ip2location.io/ip2location-documentation)

## License

Licensed under the **MIT License**. See [LICENSE.txt](https://github.com/ip2location/ip2location-io-rails/blob/main/LICENSE.txt).
