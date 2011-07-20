module Hoot
  Formatter = if defined?(RSpec)
    require 'hoot/rspec/formatter'
    Hoot::RSpec::Formatter
  else
    require 'hoot/spec/formatter'
    Hoot::Spec::Formatter
  end
end
