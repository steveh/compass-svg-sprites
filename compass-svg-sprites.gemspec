# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "compass-svg-sprites"
  spec.version       = "0.0.2"
  spec.authors       = ["Steve Hoeksema"]
  spec.email         = ["steve@thefold.co.nz"]
  spec.summary       = %q{Convert a folder of SVGs to PNGs}
  spec.description   = %q{Convert a folder of SVGs to PNGs using Compass}
  spec.homepage      = "https://github.com/steveh/compass-svg-sprites/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 10.1"

  spec.add_dependency "compass", ">= 0.12"
  spec.add_dependency "mini_magick", "~> 3.7"
end
