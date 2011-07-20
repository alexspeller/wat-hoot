require 'spec/runner/formatter/progress_bar_formatter'
require 'growl'

module Spec
  class Hoot < Spec::Runner::Formatter::ProgressBarFormatter
    include Growl

    def example_failed(example, counter, failure)
      super

      @output.puts

      color_output = StringIO.new
      def color_output.tty?
        true
      end

      noncolor_output = StringIO.new

      noncolor_message = capture_message(counter, failure, noncolor_output)

      color_message = if colour?
        capture_message(counter, failure, color_output)
      else
        noncolor_message
      end

      notify(noncolor_message) if Growl.installed?

      # Send notification to original output.
      @output.puts(color_message)

      @output.puts
      @output.flush
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

    # Capture any failure messages for the given example.
    def capture_message(counter, failure, io)
      redirect_output_to(io) do
        dump_failure(counter, failure)
        io.rewind
        io.read
      end
    end
  end
end
