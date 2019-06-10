# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "capistrano-cul"
  spec.version       = IO.read("VERSION").strip
  spec.authors       = ["Carla Galarza", "Eric O'Hanlon", "Columbia University Libraries"]
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

  spec.add_dependency 'capistrano', '~> 3.1'
  spec.add_dependency 'capistrano-git-with-submodules', '~> 2.0'

  # For supporting newer OpenSSH keys (for capistrano deployments)
  spec.add_dependency 'net-ssh', '>= 5'
  spec.add_dependency 'ed25519', '>= 1.2.4'
  spec.add_dependency 'bcrypt_pbkdf', '>= 1.0.1'


  spec.add_development_dependency "bundler", "~> 1.15"
end
