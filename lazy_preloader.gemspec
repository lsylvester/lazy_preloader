$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "lazy_preloader/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "lazy_preloader"
  s.version     = LazyPreloader::VERSION
  s.authors     = ["Lachlan Sylvester"]
  s.email       = ["lachlan.sylvester@publicisfrontfoot.com.au"]
  s.homepage    = "https://github.com/lsylvester/lazy_preloader"
  s.summary     = "Defers ActiveRecord preloading when using multifetch caching"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 5.1.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "faker"
  s.add_development_dependency "dalli"

end
