module Postcode
  # You're required to sign up for an api key at http://postcodeapi.nu
  class API
    include HTTParty

    base_uri "http://api.postcodeapi.nu"

    def initialize(api_key)
      @api_key = api_key
    end

    def postcode(postcode, options = {})
      options.merge!(:headers => { "Api-Key" => @api_key})
      response = self.class.get("/#{postcode}", options)
      Hashie::Mash.new(response.parsed_response)
    end
  end
end
