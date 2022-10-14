require_relative '../automated_init'

context "Capture" do
  capture = Output::Capture.new

  context_stack_title = Controls::Title::Context.example

  capture.context_stack = [context_stack_title]

  Controls::Output::Exercise.(capture) do |method_name, arguments|
    context "Record: #{method_name}" do
      recorded = capture.records.one? do |record|
        record.method_name == method_name &&
          record.arguments == arguments &&
          record.context_stack == [context_stack_title]
      end

      test "Recorded" do
        assert(recorded)
      end
    end

  ensure
    capture.context_stack = [context_stack_title]
  end
end
