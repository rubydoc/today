# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'today/version'

Gem::Specification.new do |spec|
  spec.name          = "today"
  spec.version       = Today::VERSION
  spec.authors       = ["Kim,SeongJun"]
  spec.email         = ["me@kimseongjun.co.kr"]
  spec.summary       = %q{Easy fetch today's happen from database, array}
  spec.description   = %q{Easy fetch today's happen from database, array}
  spec.homepage      = "https://github.com/victorkim/today"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'activerecord', '~> 4.0.1'
  spec.add_development_dependency "sqlite3-ruby"
  spec.add_development_dependency 'rspec', '~> 2.4'

end
