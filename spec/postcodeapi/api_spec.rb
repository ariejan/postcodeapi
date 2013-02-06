require File.expand_path('../../spec_helper', __FILE__)

describe Postcode::API do
  context "without a valid API key" do
    before do
      body = '{"success":false,"error":{"code":401,"message":"A valid \'Api-Key\' needs to be provided in the \'Headers\' in order to use this API."}}'
      stub_request(:get, "http://api.postcodeapi.nu/5041EB").
        with(:headers => {'Api-Key'=>'invalid'}).
        to_return(:status => 401, :body => body, :headers => {"Content-Type" => "application/json"})
    end

    subject(:api) { Postcode::API.new("invalid") }

    it 'returns an error response' do
      result = api.postcode('5041EB')

      result.success.should be_false
      result.error.code.should eq(401)
    end
  end

  context "with a valid API key" do
    context "with postcode only" do
      before do
        body = '{"success":true,"resource":{"street":"Wilhelminapark","postcode":"5041EB","town":"Tilburg","latitude":51.9401,"longitude":5.61531}}'
        stub_request(:get, "http://api.postcodeapi.nu/5041EB").
          with(:headers => {'Api-Key'=>'valid'}).
          to_return(:status => 401, :body => body, :headers => {"Content-Type" => "application/json"})
      end

      subject(:api) { Postcode::API.new("valid") }

      it 'returns an error response' do
        result = api.postcode('5041EB')

        result.success.should be_true
        result.resource.street.should eq("Wilhelminapark")
        result.resource.postcode.should eq("5041EB")
        result.resource.town.should eq("Tilburg")
        result.resource.latitude.should eq(51.9401)
        result.resource.longitude.should eq(5.61531)
      end
    end

    context "with postcode and house number" do
      before do
        body = '{"success":true,"resource":{"street":"Wilhelminapark","postcode":"5041EB","town":"Tilburg","latitude":51.9401,"longitude":5.61531}}'
        stub_request(:get, "http://api.postcodeapi.nu/5041EB/21").
          with(:headers => {'Api-Key'=>'valid'}).
          to_return(:status => 401, :body => body, :headers => {"Content-Type" => "application/json"})
      end

      subject(:api) { Postcode::API.new("valid") }

      it 'returns an error response' do
        result = api.postcode('5041EB', 21)

        result.success.should be_true
        result.resource.street.should eq("Wilhelminapark")
        result.resource.postcode.should eq("5041EB")
        result.resource.town.should eq("Tilburg")
        result.resource.latitude.should eq(51.9401)
        result.resource.longitude.should eq(5.61531)
      end
    end
  end
end



