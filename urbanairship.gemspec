lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'urbanairship/version'
require 'rake'

Gem::Specification.new do |spec|
  spec.name          = "urbanairship_v3"
  spec.version       = Urbanairship::VERSION
  spec.authors       = ["Kenneth Lim"]
  spec.email         = ["kennethlimjf@gmail.com"]
  spec.summary       = %q{Ruby binding for Urbanairship}
  spec.description   = %q{Ruby binding for Urbanairship}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = FileList['README.md', 'LICENSE.txt', 'Rakefile', 'lib/**/*.rb'].to_a
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 2.99"
  spec.add_development_dependency "pry", "~> 0.10"
end
