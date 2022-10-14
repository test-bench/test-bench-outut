require_relative '../../automated_init'

context "Capture" do
  context "Context Stack" do
    context "Enter" do
      other_title = Controls::Title.random

      context "Title" do
        title = Controls::Title.example

        capture = Output::Capture.new

        capture.context_stack = [other_title]

        capture.enter_context(title)

        pushed = capture.context_stack == [other_title, title]

        test do
          assert(pushed)
        end
      end

      context "No Title" do
        capture = Output::Capture.new

        capture.context_stack = [other_title]

        capture.enter_context(nil)

        not_pushed = capture.context_stack == [other_title]

        test "Not pushed" do
          assert(not_pushed)
        end
      end
    end
  end
end
