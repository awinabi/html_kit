# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'html_kit/version'

Gem::Specification.new do |spec|
  spec.name          = 'html_kit'
  spec.version       = HtmlKit::VERSION
  spec.authors       = ['Awin Abi']
  spec.email         = ['awinabi@gmail.com']

  spec.summary       = 'Set of tools to manipulate and parse HTML files.'
  spec.description   = 'Set of tools to manipulate and parse HTML files.'
  spec.homepage      = 'https://github.com/awinabi/html_kit'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'nokogiri', '~> 1.8.0'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
