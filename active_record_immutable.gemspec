# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record_immutable/version'

Gem::Specification.new do |spec|
  spec.name          = "active_record_immutable"
  spec.version       = ActiveRecordImmutable::VERSION
  spec.authors       = ["Benjamin Feng"]
  spec.email         = ["contact@fengb.info"]
  spec.description   = %q{Make ActiveRecord objects immutable.}
  spec.summary       = %q{Make ActiveRecord objects immutable.}
  spec.homepage      = "https://github.com/fengb/active_record_immutable"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
