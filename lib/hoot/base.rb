module Hoot
  module Base
    include Growl

    # Capture any failure messages for the given example.
    def capture_message(io, *args)
      redirect_output_to(io) do
        dump_failure(*args)
        io.rewind
        io.read
      end
    end
  end
end
