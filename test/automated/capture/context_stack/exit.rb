require_relative '../../automated_init'

context "Capture" do
  context "Context Stack" do
    context "Exit" do
      title = Controls::Title.example
      result = Controls::Result.example

      context "Title" do
        capture = Output::Capture.new

        capture.context_stack = [title]

        capture.exit_context(title, result)

        popped = capture.context_stack == []

        test do
          assert(popped)
        end
      end

      context "No Title" do
        capture = Output::Capture.new

        capture.context_stack = [title]

        capture.exit_context(nil, result)

        not_popped = capture.context_stack == [title]

        test "Not popped" do
          assert(not_popped)
        end
      end
    end
  end
end
