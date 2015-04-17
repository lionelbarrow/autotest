# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'autotest/version'

Gem::Specification.new do |spec|
  spec.name          = "autotest"
  spec.version       = Autotest::VERSION
  spec.authors       = ["lionelbarrow"]
  spec.email         = ["code@getbraintree.com"]
  spec.description   = "Intelligently generates test inputs based on your program AST"
  spec.summary       = "Intelligently generates test inputs based on your program AST"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "ruby_parser"
  spec.add_development_dependency "sexp_processor"
end
