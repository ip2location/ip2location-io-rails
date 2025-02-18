Gem::Specification.new do |s|
    s.name = 'ip2location_io_rails'
    s.version = '1.0.0'
    s.required_ruby_version = '>= 2.5.0'
    s.require_paths = ["lib"]
    s.authors = ["ip2location"]
    s.email = ["support@ip2location.com"]
    s.description = "This IP2Location.io Ruby on Rails library allows user to query for an enriched data set based on IP address. It enables user to query for an enriched data set, such as country, region, district, city, latitude & longitude, ZIP code, time zone, ASN, ISP, domain, net speed, IDD code, area code, weather station data, MNC, MCC, mobile brand, elevation, usage type, address type, advertisement category and proxy data with an IP address. It supports both IPv4 and IPv6 address lookup. This module requires API key to function. You may sign up for a free API key at https://www.ip2location.io/pricing."
    s.summary = "IP2Location.io Ruby on Rails library"
    s.homepage = 'https://www.ip2location.io'
    s.licenses = ["MIT"]
    s.files = [
        "LICENSE.txt",
        "Gemfile",
        "README.md",
        "ip2location_io_rails.gemspec",
        "lib/ip2location_io_rails.rb",
    ]
    if s.respond_to?(:metadata=)
        s.metadata = {
          "bug_tracker_uri" => "https://github.com/ip2location/ip2location-io-rails/issues",
          "documentation_uri" => "https://www.rubydoc.info/gems/ip2location_io_rails",
          "homepage_uri" => "https://www.ip2location.io",
          "source_code_uri" => "https://github.com/ip2location/ip2location-io-rails",
        }
    end
    s.add_runtime_dependency 'ip2location_io_ruby', '>= 1.0.1'
end
