Gem::Specification.new do |s|
  s.name = "hoot"
  s.summary = "An RSpec formatter that details failures as they happen."
  s.version = "1.0.0"
  s.authors = ["Hanna Kalinowska", "Paul Mucur"]
  s.homepage = "http://github.com/nature/hoot"
  s.email = "no-reply@nature.com"
  s.files = [
    "lib/hoot.rb",
    "lib/hoot/base.rb",
    "lib/hoot/formatter.rb",
    "lib/hoot/rspec/formatter.rb",
    "lib/hoot/spec/formatter.rb",
    "README.md"
  ]
  s.add_dependency("growl", "~> 1.0.3")
end

