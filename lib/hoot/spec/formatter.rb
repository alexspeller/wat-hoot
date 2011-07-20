require 'spec/runner/formatter/progress_bar_formatter'
require 'hoot/base'

module Hoot
  module Spec
    class Formatter < ::Spec::Runner::Formatter::ProgressBarFormatter
      include Base

      attr_reader :output

      def example_failed(example, counter, failure)
        super

        output.puts

        noncolor_output = StringIO.new
        color_output = StringIO.new
        def color_output.tty?
          true
        end

        noncolor_message = capture_message(noncolor_output, counter, failure)

        color_message = if colour?
          capture_message(color_output, counter, failure)
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
        @output = output
        result = yield
        @output = original_output
        result
      end
    end
  end
end
