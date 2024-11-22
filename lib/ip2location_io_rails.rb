require 'ip2location_io_ruby'

class Ip2locationIORails
    def initialize(ip_address)
        # @ip_address = ip_address
        IP2LocationIORuby::Configuration.api_key = Rails.configuration.ip2location_io_key
        @i2lio = IP2LocationIORuby::Api::IPGeolocation.lookup(ip_address)
    end

    def location
        @i2lio
    end
end
