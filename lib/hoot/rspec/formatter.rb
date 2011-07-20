require 'rspec/core/formatters/progress_formatter'
require 'hoot/base'

module Hoot
  module RSpec
    class Formatter < ::RSpec::Core::Formatters::ProgressFormatter
      include Base

      def example_failed(example)
        super

        2.times { output.puts }

        noncolor_output = StringIO.new
        color_output = StringIO.new
        def color_output.tty?
          true
        end

        noncolor_message = capture_message(noncolor_output, example, failed_examples.size - 1)

        color_message = if color_enabled?
          capture_message(color_output, example, failed_examples.size - 1)
        else
          noncolor_message
        end

        notify(noncolor_message) if Growl.installed?

        # Send notification to original output.
        output.puts(color_message)

        output.puts
      end

      private

      # Redirect output during the execution of a given block.
      def redirect_output_to(output)
        original_output = @output
        @output = configuration.output = output
        result = yield
        @output = configuration.output = original_output
        result
      end
    end
  end
end
