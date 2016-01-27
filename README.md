# Postcodeapi [![Build Status](https://travis-ci.org/ariejan/postcodeapi.png?branch=master)](https://travis-ci.org/ariejan/postcodeapi)

This is a small Ruby wrapper around the postcodeapi.nu API, which allows you 
to resolve Dutch postcodes to street and city names.

**postcodeapi-2.x is only compatible with PostcodeAPI v2. PostcodeAPI v1 is 
deprecated and will be taken offline on 2016-03-01.**

## Installation

Add this line to your application's Gemfile:

    gem 'postcodeapi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install postcodeapi

## Usage

Firstly, sign up for a free API key at http://postcodeapi.nu, then use this gem like this:

    require 'pp'
    require 'postcodeapi'

    api = Postcode::API.new("your-api-key")

    irb> pp api.addresses("5694AJ", 1)
    {"addresses"=>
      [{"city"=>{"id"=>"3520", "label"=>"Son en Breugel"},
        "letter"=>nil,
        "id"=>"0848200000005576",
        "purpose"=>"woonfunctie",
        "postcode"=>"5694AJ",
        "municipality"=>{"id"=>"0848", "label"=>"Son en Breugel"},
        "nen5825"=>{"street"=>"SINT CATHARINASTRAAT", "postcode"=>"5694 AJ"},
        "street"=>"Sint Catharinastraat",
        "number"=>1,
        "province"=>{"id"=>"30", "label"=>"Noord-Brabant"},
        "addition"=>nil,
        "geo"=>
         {"center"=>
           {"wgs84"=>
             {"crs"=>
               {"properties"=>{"name"=>"urn:ogc:def:crs:OGC:1.3:CRS84"},
                "type"=>"name"},
              "type"=>"Point",
              "coordinates"=>[5.50767699298, 51.5131728171]},
            "rd"=>
             {"crs"=>
               {"properties"=>{"name"=>"urn:ogc:def:crs:EPSG::28992"},
                "type"=>"name"},
              "type"=>"Point",
              "coordinates"=>[163363, 391581]}}},
        "type"=>"Verblijfsobject",
        "_links"=>
         {"self"=>
           {"href"=>
             "https://postcode-api.apiwise.nl/v2/addresses/0848200000005576/"}}}]}
               
There is also `#simple_addresses` to retrieve a minimal set of data:

     irb> pp api.simple_addresses("5694AJ", 1)
	 {"addresses"=>
       [{"latitude"=>51.5131728171,
         "longitude"=>5.50767699298,
         "municipality"=>"Son en Breugel",
         "postcode"=>"5694AJ",
         "province"=>"Noord-Brabant",
         "street"=>"Sint Catharinastraat"}]}

Please note that the house number is optional. 

## Contributing

Please make sure you add specs for your features. Pull requests without proper
specs will not be merged.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Contributors

Original author: 

 * Ariejan de Vroom, https://ariejan.net

Github contributors

 * pedrocatalao
 * martijn
 * WvanLelyveld

## LICENSE

Copyright (c) 2013-2016 Ariejan de Vroom

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
