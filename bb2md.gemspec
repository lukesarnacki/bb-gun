# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bb2md/version'

Gem::Specification.new do |gem|
  gem.name          = "bb2md"
  gem.version       = Bb2md::VERSION
  gem.authors       = ["Lukasz Sarnacki"]
  gem.email         = ["lukesarnacki@gmail.com"]
  gem.description   = %q{BB code to Markdown converter}
  gem.summary       = %q{Converts BB code to Markdown}
  gem.homepage      = "http://github.com/lukesarnacki/bb2md"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency "rspec", "~> 2.12.0"
end
