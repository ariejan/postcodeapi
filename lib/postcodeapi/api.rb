module Postcode
  # You're required to sign up for an api key at http://www.postcodeapi.nu/
  class API
    BASE_URI = 'https://postcode-api.apiwise.nl'

    def initialize(api_key)
      @api_key = api_key
    end

    def postcode(postcode, house_number = nil, options = {})
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

      content._embedded.addresses
    end

    def sanitize(postcode)
      postcode.gsub(/\s+/, '').upcase
    end
  end
end
