$:.unshift(File.dirname(__FILE__))

Hoot = if defined?(RSpec)
  require 'rspec/hoot'
  RSpec::Hoot
else
  require 'spec/hoot'
  Spec::Hoot
end
