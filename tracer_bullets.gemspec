# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tracer_bullets/version'

Gem::Specification.new do |spec|
  spec.name          = "tracer_bullets"
  spec.version       = TracerBullets::VERSION
  spec.authors       = ["nate"]
  spec.email         = ["nate@cityposh.com"]
  spec.description   = %q{A simple way to see time expiration in your Rails log files}
  spec.summary       = %q{A simple way to see time expiration in your Rails log files}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
