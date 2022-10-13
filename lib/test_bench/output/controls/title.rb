module TestBench
  module Output
    module Controls
      module Title
        def self.example(suffix=nil, text: nil)
          suffix = " #{suffix}" if not suffix.nil?
          text ||= "Some Title"

          "#{text}#{suffix}"
        end

        module Random
          def random = example(Controls::Random.string)
        end
        extend Random

        module Test
          extend Random

          def self.example(suffix=nil)
            Title.example(suffix, text:)
          end

          def self.text = "Some test"
        end

        module Context
          extend Random

          def self.example(suffix=nil)
            Title.example(suffix, text:)
          end
          def self.text = "Some Context"
        end
      end
    end
  end
end
