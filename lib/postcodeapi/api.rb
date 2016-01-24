module Postcode
  # You're required to sign up for an api key at http://www.postcodeapi.nu/
  class API
    BASE_URI = 'https://postcode-api.apiwise.nl'

    def initialize(api_key)
      @api_key = api_key
    end

    # Returns an address list for a given postcode with all raw data that the api disposes
    def addresses(postcode, house_number = nil, options = {})
      postcode = sanitize(postcode)
      uri = URI.parse([BASE_URI, 'v2', 'addresses'].compact.join('/'))
      uri.query = URI.encode_www_form( {'postcode' => postcode, 'number' => house_number} )

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(uri.request_uri)
      request.add_field('X-Api-Key', @api_key)
      response = http.request(request)

      content = Hashie::Mash.new(JSON.parse(response.body))

      return content if content.error
      content._embedded
    end

    # Returns simplified addresses for a given postcode with only essential filtered data
    def simple_addresses(postcode, house_number = nil, options = {})
      content = addresses(postcode, house_number, options)

      return content if content.error
      simplify(content)
    end

    private

    def simplify(content)
      addresses = []
      content.addresses.each do |entry|
        addresses << Hashie::Mash.new(
              { latitude: entry.geo.center.wgs84.coordinates.last,
                longitude: entry.geo.center.wgs84.coordinates.first,
                municipality: entry.municipality.label,
                postcode: entry.postcode,
                province: entry.province.label,
                street: entry.street
              } )
      end
      Hashie::Mash.new({addresses: addresses})
    end

    def sanitize(postcode)
      postcode.gsub(/\s+/, '').upcase
    end

  end
end
