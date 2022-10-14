module TestBench
  module Output
    module Controls
      module Output
        def self.example
          Example.new
        end

        class Example
          include TestBench::Output
        end

        module Exercise
          def self.call(output=nil, &block)
            output ||= Output.example

            context_title = Title::Context.example
            test_title = Title::Context.example
            result = Result.example
            path = Path.example
            line_number = LineNumber.example
            comment_text = Comment.example
            error_text = Error::Text.example
            fixture_name = FixtureName.example

            argument_values = { context_title:, test_title:, result:, path:, line_number:, comment_text:, error_text:, fixture_name: }

            [
              [:enter_context, [:context_title]],
              [:exit_context, [:context_title, :result]],
              [:skip_context, [:context_title]],

              [:start_test, [:test_title]],
              [:finish_test, [:test_title, :result]],
              [:skip_test, [:test_title]],

              [:assert, [:result, :path, :line_number]],

              [:comment, [:comment_text]],

              [:error, [:error_text]],

              [:increase_detail, []],
              [:decrease_detail, []],

              [:start, []],
              [:finish, [:result]],

              [:enter_file, [:path]],
              [:exit_file, [:path, :result]],

              [:start_fixture, [:fixture_name]],
              [:finish_fixture, [:fixture_name, :result]]
            ].each do |method_name, arguments|
              arguments = arguments.map do |argument|
                argument_values.fetch(argument)
              end

              output.public_send(method_name, *arguments)

              if not block.nil?
                block.(method_name, arguments)
              end
            end
          end
        end
      end
    end
  end
end
