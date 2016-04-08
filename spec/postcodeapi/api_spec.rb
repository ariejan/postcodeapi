require File.expand_path('../../spec_helper', __FILE__)

describe Postcode::API do
  context "without a valid API key" do
    before do
      body = '{"error":"API key is invalid."}'
      stub_request(:get, "https://postcode-api.apiwise.nl/v2/addresses?number&postcode=5041EB").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby', 'X-Api-Key'=>'invalid'}).
        to_return(:status => 401, :body => body, :headers => {"Content-Type" => "application/json"})
    end

    subject(:api) { Postcode::API.new("invalid") }

    context "for raw data request" do
      it 'returns an error response' do
        result = api.addresses('5041EB')

        expect(result.error).to eq("API key is invalid.")
      end
    end

    context "for simplified data request" do
      it 'also returns an error response' do
        result = api.simple_addresses('5041EB')

        expect(result.error).to eq("API key is invalid.")
      end
    end
  end

  context "with a valid API key" do
    context "with postcode only" do
      before do
        body = '{"_embedded":{"addresses":[{"city":{"id":"1043","label":"Tilburg"},"letter":"a","id":"0855200000066230","purpose":"kantoorfunctie","postcode":"5041EB","municipality":{"id":"0855","label":"Tilburg"},"nen5825":{"street":"WILHELMINAPARK","postcode":"5041 EB"},"street":"Wilhelminapark","number":17,"province":{"id":"30","label":"Noord-Brabant"},"addition":null,"geo":{"center":{"wgs84":{"crs":{"properties":{"name":"urn:ogc:def:crs:OGC:1.3:CRS84"},"type":"name"},"type":"Point","coordinates":[5.07699118186,51.5666652242]},"rd":{"crs":{"properties":{"name":"urn:ogc:def:crs:EPSG::28992"},"type":"name"},"type":"Point","coordinates":[133491.678,397570.947]}}},"type":"Verblijfsobject","_links":{"self":{"href":"https://postcode-api.apiwise.nl/v2/addresses/0855200000066230/"}}},{"city":{"id":"1043","label":"Tilburg"},"letter":null,"id":"0855200000060997","purpose":"kantoorfunctie","postcode":"5041EB","municipality":{"id":"0855","label":"Tilburg"},"nen5825":{"street":"WILHELMINAPARK","postcode":"5041 EB"},"street":"Wilhelminapark","number":17,"province":{"id":"30","label":"Noord-Brabant"},"addition":null,"geo":{"center":{"wgs84":{"crs":{"properties":{"name":"urn:ogc:def:crs:OGC:1.3:CRS84"},"type":"name"},"type":"Point","coordinates":[5.07703198051,51.5666742042]},"rd":{"crs":{"properties":{"name":"urn:ogc:def:crs:EPSG::28992"},"type":"name"},"type":"Point","coordinates":[133494.511,397571.934]}}},"type":"Verblijfsobject","_links":{"self":{"href":"https://postcode-api.apiwise.nl/v2/addresses/0855200000060997/"}}},{"city":{"id":"1043","label":"Tilburg"},"letter":null,"id":"0855200000060998","purpose":"kantoorfunctie","postcode":"5041EB","municipality":{"id":"0855","label":"Tilburg"},"nen5825":{"street":"WILHELMINAPARK","postcode":"5041 EB"},"street":"Wilhelminapark","number":18,"province":{"id":"30","label":"Noord-Brabant"},"addition":null,"geo":{"center":{"wgs84":{"crs":{"properties":{"name":"urn:ogc:def:crs:OGC:1.3:CRS84"},"type":"name"},"type":"Point","coordinates":[5.07706422938,51.5666172658]},"rd":{"crs":{"properties":{"name":"urn:ogc:def:crs:EPSG::28992"},"type":"name"},"type":"Point","coordinates":[133496.72,397565.59]}}},"type":"Verblijfsobject","_links":{"self":{"href":"https://postcode-api.apiwise.nl/v2/addresses/0855200000060998/"}}},{"city":{"id":"1043","label":"Tilburg"},"letter":"b","id":"0855200000061000","purpose":"industriefunctie","postcode":"5041EB","municipality":{"id":"0855","label":"Tilburg"},"nen5825":{"street":"WILHELMINAPARK","postcode":"5041 EB"},"street":"Wilhelminapark","number":19,"province":{"id":"30","label":"Noord-Brabant"},"addition":null,"geo":{"center":{"wgs84":{"crs":{"properties":{"name":"urn:ogc:def:crs:OGC:1.3:CRS84"},"type":"name"},"type":"Point","coordinates":[5.07709246364,51.5665293687]},"rd":{"crs":{"properties":{"name":"urn:ogc:def:crs:EPSG::28992"},"type":"name"},"type":"Point","coordinates":[133498.636,397555.803]}}},"type":"Verblijfsobject","_links":{"self":{"href":"https://postcode-api.apiwise.nl/v2/addresses/0855200000061000/"}}},{"city":{"id":"1043","label":"Tilburg"},"letter":"a","id":"0855200000060999","purpose":"woonfunctie","postcode":"5041EB","municipality":{"id":"0855","label":"Tilburg"},"nen5825":{"street":"WILHELMINAPARK","postcode":"5041 EB"},"street":"Wilhelminapark","number":19,"province":{"id":"30","label":"Noord-Brabant"},"addition":null,"geo":{"center":{"wgs84":{"crs":{"properties":{"name":"urn:ogc:def:crs:OGC:1.3:CRS84"},"type":"name"},"type":"Point","coordinates":[5.07708494827,51.5665443149]},"rd":{"crs":{"properties":{"name":"urn:ogc:def:crs:EPSG::28992"},"type":"name"},"type":"Point","coordinates":[133498.122,397557.468]}}},"type":"Verblijfsobject","_links":{"self":{"href":"https://postcode-api.apiwise.nl/v2/addresses/0855200000060999/"}}},{"city":{"id":"1043","label":"Tilburg"},"letter":null,"id":"0855200000061001","purpose":"woonfunctie","postcode":"5041EB","municipality":{"id":"0855","label":"Tilburg"},"nen5825":{"street":"WILHELMINAPARK","postcode":"5041 EB"},"street":"Wilhelminapark","number":21,"province":{"id":"30","label":"Noord-Brabant"},"addition":null,"geo":{"center":{"wgs84":{"crs":{"properties":{"name":"urn:ogc:def:crs:OGC:1.3:CRS84"},"type":"name"},"type":"Point","coordinates":[5.07717893166,51.566414786]},"rd":{"crs":{"properties":{"name":"urn:ogc:def:crs:EPSG::28992"},"type":"name"},"type":"Point","coordinates":[133504.577,397543.03]}}},"type":"Verblijfsobject","_links":{"self":{"href":"https://postcode-api.apiwise.nl/v2/addresses/0855200000061001/"}}},{"city":{"id":"1043","label":"Tilburg"},"letter":"b","id":"0855200000061004","purpose":"woonfunctie","postcode":"5041EB","municipality":{"id":"0855","label":"Tilburg"},"nen5825":{"street":"WILHELMINAPARK","postcode":"5041 EB"},"street":"Wilhelminapark","number":22,"province":{"id":"30","label":"Noord-Brabant"},"addition":null,"geo":{"center":{"wgs84":{"crs":{"properties":{"name":"urn:ogc:def:crs:OGC:1.3:CRS84"},"type":"name"},"type":"Point","coordinates":[5.07720777743,51.566283727]},"rd":{"crs":{"properties":{"name":"urn:ogc:def:crs:EPSG::28992"},"type":"name"},"type":"Point","coordinates":[133506.515,397528.441]}}},"type":"Verblijfsobject","_links":{"self":{"href":"https://postcode-api.apiwise.nl/v2/addresses/0855200000061004/"}}},{"city":{"id":"1043","label":"Tilburg"},"letter":null,"id":"0855200000110606","purpose":"woonfunctie","postcode":"5041EB","municipality":{"id":"0855","label":"Tilburg"},"nen5825":{"street":"WILHELMINAPARK","postcode":"5041 EB"},"street":"Wilhelminapark","number":22,"province":{"id":"30","label":"Noord-Brabant"},"addition":null,"geo":{"center":{"wgs84":{"crs":{"properties":{"name":"urn:ogc:def:crs:OGC:1.3:CRS84"},"type":"name"},"type":"Point","coordinates":[5.07724882372,51.5662923031]},"rd":{"crs":{"properties":{"name":"urn:ogc:def:crs:EPSG::28992"},"type":"name"},"type":"Point","coordinates":[133509.365,397529.383]}}},"type":"Verblijfsobject","_links":{"self":{"href":"https://postcode-api.apiwise.nl/v2/addresses/0855200000110606/"}}},{"city":{"id":"1043","label":"Tilburg"},"letter":null,"id":"0855200000061005","purpose":"woonfunctie","postcode":"5041EB","municipality":{"id":"0855","label":"Tilburg"},"nen5825":{"street":"WILHELMINAPARK","postcode":"5041 EB"},"street":"Wilhelminapark","number":23,"province":{"id":"30","label":"Noord-Brabant"},"addition":null,"geo":{"center":{"wgs84":{"crs":{"properties":{"name":"urn:ogc:def:crs:OGC:1.3:CRS84"},"type":"name"},"type":"Point","coordinates":[5.07728036245,51.5662336728]},"rd":{"crs":{"properties":{"name":"urn:ogc:def:crs:EPSG::28992"},"type":"name"},"type":"Point","coordinates":[133511.524,397522.851]}}},"type":"Verblijfsobject","_links":{"self":{"href":"https://postcode-api.apiwise.nl/v2/addresses/0855200000061005/"}}},{"city":{"id":"1043","label":"Tilburg"},"letter":null,"id":"0855200000061006","purpose":"winkelfunctie","postcode":"5041EB","municipality":{"id":"0855","label":"Tilburg"},"nen5825":{"street":"WILHELMINAPARK","postcode":"5041 EB"},"street":"Wilhelminapark","number":24,"province":{"id":"30","label":"Noord-Brabant"},"addition":null,"geo":{"center":{"wgs84":{"crs":{"properties":{"name":"urn:ogc:def:crs:OGC:1.3:CRS84"},"type":"name"},"type":"Point","coordinates":[5.07731653182,51.5661664347]},"rd":{"crs":{"properties":{"name":"urn:ogc:def:crs:EPSG::28992"},"type":"name"},"type":"Point","coordinates":[133514,397515.36]}}},"type":"Verblijfsobject","_links":{"self":{"href":"https://postcode-api.apiwise.nl/v2/addresses/0855200000061006/"}}},{"city":{"id":"1043","label":"Tilburg"},"letter":null,"id":"0855200000061007","purpose":"kantoorfunctie","postcode":"5041EB","municipality":{"id":"0855","label":"Tilburg"},"nen5825":{"street":"WILHELMINAPARK","postcode":"5041 EB"},"street":"Wilhelminapark","number":25,"province":{"id":"30","label":"Noord-Brabant"},"addition":null,"geo":{"center":{"wgs84":{"crs":{"properties":{"name":"urn:ogc:def:crs:OGC:1.3:CRS84"},"type":"name"},"type":"Point","coordinates":[5.07738142047,51.5660457722]},"rd":{"crs":{"properties":{"name":"urn:ogc:def:crs:EPSG::28992"},"type":"name"},"type":"Point","coordinates":[133518.442,397501.917]}}},"type":"Verblijfsobject","_links":{"self":{"href":"https://postcode-api.apiwise.nl/v2/addresses/0855200000061007/"}}},{"city":{"id":"1043","label":"Tilburg"},"letter":null,"id":"0855200000061008","purpose":"woonfunctie","postcode":"5041EB","municipality":{"id":"0855","label":"Tilburg"},"nen5825":{"street":"WILHELMINAPARK","postcode":"5041 EB"},"street":"Wilhelminapark","number":27,"province":{"id":"30","label":"Noord-Brabant"},"addition":null,"geo":{"center":{"wgs84":{"crs":{"properties":{"name":"urn:ogc:def:crs:OGC:1.3:CRS84"},"type":"name"},"type":"Point","coordinates":[5.07745550693,51.5659044692]},"rd":{"crs":{"properties":{"name":"urn:ogc:def:crs:EPSG::28992"},"type":"name"},"type":"Point","coordinates":[133523.512,397486.175]}}},"type":"Verblijfsobject","_links":{"self":{"href":"https://postcode-api.apiwise.nl/v2/addresses/0855200000061008/"}}}]},"_links":{"self":{"href":"https://postcode-api.apiwise.nl/v2/addresses/?postcode=5041EB"}}}'
        stub_request(:get, "https://postcode-api.apiwise.nl/v2/addresses?number&postcode=5041EB").
          with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby', 'X-Api-Key'=>'valid'}).
          to_return(:status => 200, :body => body, :headers => {"Content-Type" => "application/json"})
      end

      subject(:api) { Postcode::API.new("valid") }

      context "for raw data request" do
        it 'returns an success response with correct format' do
          result = api.addresses('5041EB')

          expect(result.addresses).to_not be_empty
          expect(result.addresses.first.street).to eq("Wilhelminapark")
          expect(result.addresses.first.postcode).to eq("5041EB")
          expect(result.addresses.first.city.label).to eq("Tilburg")
          expect(result.addresses.first.municipality.label).to eq("Tilburg")
          expect(result.addresses.first.geo.center.wgs84.coordinates.last).to eq(51.5666652242)
          expect(result.addresses.first.geo.center.wgs84.coordinates.first).to eq(5.07699118186)
        end
      end

      context "for simplified data request" do
        it 'returns an success response' do
          result = api.simple_addresses('5041EB')

          expect(result.addresses).not_to be_empty
          expect(result.addresses.first.street).to eq("Wilhelminapark")
          expect(result.addresses.first.postcode).to eq("5041EB")
          expect(result.addresses.first.city).to eq("Tilburg")
          expect(result.addresses.first.municipality).to eq("Tilburg")
          expect(result.addresses.first.latitude).to eq(51.5666652242)
          expect(result.addresses.first.longitude).to eq(5.07699118186)
        end
      end

      it 'sanitizes input before lookup' do
        result = api.simple_addresses('5041 eb')

        expect(result.addresses).to_not be_empty
        expect(result.addresses.first.postcode).to eq("5041EB")
      end
    end

    context "with postcode and house number" do
      before do
        body = '{"_embedded":{"addresses":[{"city":{"id":"1043","label":"Tilburg"},"letter":null,"id":"0855200000061001","purpose":"woonfunctie","postcode":"5041EB","municipality":{"id":"0855","label":"Tilburg"},"nen5825":{"street":"WILHELMINAPARK","postcode":"5041 EB"},"street":"Wilhelminapark","number":21,"province":{"id":"30","label":"Noord-Brabant"},"addition":null,"geo":{"center":{"wgs84":{"crs":{"properties":{"name":"urn:ogc:def:crs:OGC:1.3:CRS84"},"type":"name"},"type":"Point","coordinates":[5.07717893166,51.566414786]},"rd":{"crs":{"properties":{"name":"urn:ogc:def:crs:EPSG::28992"},"type":"name"},"type":"Point","coordinates":[133504.577,397543.03]}}},"type":"Verblijfsobject","_links":{"self":{"href":"https://postcode-api.apiwise.nl/v2/addresses/0855200000061001/"}}}]},"_links":{"self":{"href":"https://postcode-api.apiwise.nl/v2/addresses/?postcode=5041EB&number=21"}}}'
        stub_request(:get, "https://postcode-api.apiwise.nl/v2/addresses?number=21&postcode=5041EB").
          with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby', 'X-Api-Key'=>'valid'}).
          to_return(:status => 200, :body => body, :headers => {"Content-Type" => "application/json"})
      end

      subject(:api) { Postcode::API.new("valid") }

      it 'returns an error response' do
        result = api.simple_addresses('5041EB', 21)

        expect(result.addresses).to_not be_empty
        expect(result.addresses.first.street).to eq("Wilhelminapark")
        expect(result.addresses.first.postcode).to eq("5041EB")
        expect(result.addresses.first.city).to eq("Tilburg")
        expect(result.addresses.first.municipality).to eq("Tilburg")
        expect(result.addresses.first.latitude).to eq(51.566414786)
        expect(result.addresses.first.longitude).to eq(5.07717893166)
      end
    end
  end
end
