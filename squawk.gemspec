Gem::Specification.new do |s|
  s.name = "squawk"
  s.summary = "An RSpec formatter that details failures as they happen."
  s.version = "1.0.0"
  s.authors = ["Hanna Kalinowska", "Paul Mucur"]
  s.homepage = "http://github.com/nature/squawk"
  s.email = "no-reply@nature.com"
  s.files = [ "lib/squawk.rb", "README.md" ]
  s.add_dependency("rspec-core", "~> 2.6.4")
  s.add_dependency("growl", "~> 1.0.3")
  s.add_development_dependency("rspec", "~> 2.6.0")
end

