module Postcode
  # You're required to sign up for an api key at http://postcodeapi.nu
  class API
    include HTTParty

    base_uri "http://api.postcodeapi.nu"

    def initialize(api_key)
      @api_key = api_key
    end

    def postcode(postcode, house_number = nil, options = {})
      options.merge!(:headers => { "Api-Key" => @api_key})
      query = [postcode, house_number].compact.join("/")
      response = self.class.get("/#{query}", options)
      Hashie::Mash.new(response.parsed_response)
    end
  end
end
