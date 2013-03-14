module Postcode
  # You're required to sign up for an api key at http://postcodeapi.nu
  class API
    BASE_URI = "http://api.postcodeapi.nu"

    def initialize(api_key)
      @api_key = api_key
    end

    def postcode(postcode, house_number = nil, options = {})
      uri = URI.parse([BASE_URI, postcode, house_number].compact.join('/'))

      req = Net::HTTP::Get.new(uri.path)
      req.add_field('Api-Key', @api_key)

      res = Net::HTTP.new(uri.host, uri.port).start do |http|
        http.request(req)
      end

      Hashie::Mash.new(JSON.parse(res.body))
    end
  end
end
