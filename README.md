# Postcodeapi [![Build Status](https://travis-ci.org/ariejan/postcodeapi.png?branch=master)](https://travis-ci.org/ariejan/postcodeapi)

This is a small Ruby wrapper around the postcodeapi.nu API, which allows you 
to resolve Dutch postcodes to street and city names.

## Installation

Add this line to your application's Gemfile:

    gem 'postcodeapi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install postcodeapi

## Usage

Firstly, sign up for a free API key at http://postcodeapi.nu, then juse this gem:

    api = Postcode::API.new("your-api-key")
    result = api.postcode("5041EB")

    result.resource.street
    => "Wilhelminastraat"

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

## LICENSE

Copyright (c) 2013 Ariejan de Vroom

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
