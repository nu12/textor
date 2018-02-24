$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "textor/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "textor"
  s.version     = Textor::VERSION
  s.authors     = ["Alysson A Costa"]
  s.email       = ["alysson.avila.costa@gmail.com"]
  s.homepage    = "http://www.github.com/nu12/textor"
  s.summary     = "Textor is a Rails Engine to create TeX documents structure within a Rails application."
  s.description = "Textor is a Rails Engine to create TeX documents structure within a Rails application."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 5.0"
  s.add_dependency "acts_as_list"

  s.add_development_dependency "rails", "~> 5.2.0.rc1"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  
end
