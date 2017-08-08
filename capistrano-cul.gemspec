# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "capistrano-cul"
  spec.version       = IO.read("VERSION").strip
  spec.authors       = ["Carla Galarza", "Columbia University Libraries"]
  spec.email         = ["cmg2228@columbia.edu"]

  spec.summary       = "Common capistrano tasks shared across projects at CUL"
  spec.homepage      = "https://github.com/cul/capistrano-cul"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
end
