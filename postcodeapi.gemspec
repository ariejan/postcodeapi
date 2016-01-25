# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'postcodeapi/version'

Gem::Specification.new do |gem|
  gem.name          = "postcodeapi"
  gem.version       = Postcode::VERSION
  gem.authors       = ["Ariejan de Vroom"]
  gem.email         = ["ariejan@ariejan.net"]
  gem.description   = %q{Wrapper around the postcodeapi.nu API for resolving Dutch postal codes}
  gem.summary       = %q{Wrapper around the postcodeapi.nu API.}
  gem.homepage      = "https://github.com/ariejan/postcodeapi"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'hashie', '>= 3.4.3'

  gem.add_development_dependency 'rake', '~> 10.5.0'
  gem.add_development_dependency 'rspec', '~> 3.4.0'
  gem.add_development_dependency 'webmock', '~> 1.22.6'
end
