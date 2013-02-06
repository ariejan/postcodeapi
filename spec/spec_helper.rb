require 'rspec'
require 'webmock/rspec'

require File.expand_path('../../lib/postcodeapi', __FILE__)

RSpec.configure do |config|
  config.include WebMock::API
end
