# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'imggrabber/version'

Gem::Specification.new do |spec|
  spec.name          = 'imggrabber'
  spec.version       = Imggrabber::VERSION
  spec.authors       = ['Stanislav Budaev']
  spec.email         = ['cafekoma@gmail.com']

  spec.summary       = %q{Simple image grabber}
  spec.description   = %q{Gem for grab images from any url}
  spec.homepage      = 'http://github.com/sabudaye/imggrabber'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
end
