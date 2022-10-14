module TestBench
  module Output
    def enter_context(title)
    end

    def exit_context(title, result)
    end

    def skip_context(title)
    end

    def start_test(title)
    end

    def finish_test(title, result)
    end

    def skip_test(title)
    end

    def assert(result, path, line_number)
    end

    def comment(text)
    end

    def error(text)
    end

    def increase_detail
    end

    def decrease_detail
    end

    def start
    end

    def finish(result)
    end

    def enter_file(path)
    end

    def exit_file(path, result)
    end

    def start_fixture(fixture_name)
    end

    def finish_fixture(fixture_name, result)
    end
  end
end
