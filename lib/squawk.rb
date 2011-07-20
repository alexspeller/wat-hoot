require 'rspec/core/formatters/progress_formatter'
require 'growl'

class Squawk < RSpec::Core::Formatters::ProgressFormatter
  include Growl

  def example_failed(example)
    super(example)

    2.times { output.puts }

    color_output = StringIO.new
    def color_output.tty?
      true
    end

    noncolor_output = StringIO.new
    def noncolor_output.tty?
      false
    end

    noncolor_message = capture_message(example, noncolor_output)

    color_message = if color_enabled?
      capture_message(example, color_output)
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
    configuration.output = @output = output
    result = yield
    configuration.output = @output = original_output
    result
  end

  # Capture any failure messages for the given example.
  def capture_message(example, io)
    redirect_output_to(io) do
      dump_failure(example, failed_examples.size - 1)
      io.rewind
      io.read
    end
  end
end

