$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "textor/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "textor"
  s.version     = Textor::VERSION
  s.authors     = ["Alysson A Costa"]
  s.email       = ["alysson.avila.costa@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Textor."
  s.description = "TODO: Description of Textor."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.0.rc1"

  s.add_development_dependency "sqlite3"
end
