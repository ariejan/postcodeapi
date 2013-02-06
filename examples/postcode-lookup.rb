require 'rubygems'
require 'postcodeapi'

api = Postcode::API.new("your-api-key")
result = api.postcode("5505NB")

puts result.inspect
