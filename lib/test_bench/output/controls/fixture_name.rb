module TestBench
  module Output
    module Controls
      module FixtureName
        def self.example(suffix=nil)
          suffix = "_#{suffix}" if not suffix.nil?

          "SomeProject::Fixtures::SomeFixture#{suffix}"
        end
        def self.random = example(Random.string)
      end
    end
  end
end
