module TestBench
  module Output
    class Capture
      include Output

      def records
        @records ||= []
      end
      attr_writer :context_stack

      def context_stack
        @context_stack ||= []
      end
      attr_writer :context_stack

      def enter_context(title)
        record(:enter_context, [title])

        if not title.nil?
          context_stack.push(title)
        end
      end

      def exit_context(title, result)
        record(:exit_context, [title, result])

        if not title.nil?
          context_stack.pop
        end
      end

      def skip_context(title)
        record(:skip_context, [title])
      end

      def start_test(title)
        record(:start_test, [title])
      end

      def finish_test(title, result)
        record(:finish_test, [title, result])
      end

      def skip_test(title)
        record(:skip_test, [title])
      end

      def assert(result, path, line_number)
        record(:assert, [result, path, line_number])
      end

      def comment(text)
        record(:comment, [text])
      end

      def error(text)
        record(:error, [text])
      end

      def increase_detail
        record(:increase_detail, [])
      end

      def decrease_detail
        record(:decrease_detail, [])
      end

      def start
        record(:start, [])
      end

      def finish(result)
        record(:finish, [result])
      end

      def enter_file(path)
        record(:enter_file, [path])
      end

      def exit_file(path, result)
        record(:exit_file, [path, result])
      end

      def start_fixture(fixture_name)
        record(:start_fixture, [fixture_name])
      end

      def finish_fixture(fixture_name, result)
        record(:finish_fixture, [fixture_name, result])
      end

      def record(method_name, arguments)
        context_stack = self.context_stack.dup

        record = Record.new(method_name, arguments, context_stack)
        records << record
        record
      end

      Record = Struct.new(:method_name, :arguments, :context_stack)
    end
  end
end
