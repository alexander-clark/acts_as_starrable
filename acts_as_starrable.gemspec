$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "acts_as_starrable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "acts_as_starrable"
  s.version     = ActsAsStarrable::VERSION
  s.authors     = ["Alexander Clark"]
  s.email       = ["sasha.jackal@gmail.com"]
  s.homepage    = "https://github.com/alexander-clark/acts_as_starrable"
  s.summary     = "Add stars to stuff"
  s.description = "Add the ability to give star ratings to various models."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.12"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-spork'
  s.add_development_dependency 'shoulda-matchers'

  s.test_files = Dir["spec/**/*"]
end
