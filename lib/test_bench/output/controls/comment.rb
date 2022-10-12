module TestBench
  module Output
    module Controls
      module Comment
        def self.example(suffix=nil)
          suffix = " #{suffix}" if not suffix.nil?

          "Some comment#{suffix}"
        end
        def self.random = example(Random.string)
      end
    end
  end
end
