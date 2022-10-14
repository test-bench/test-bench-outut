module TestBench
  module Output
    module Controls
      module Result
        def self.example = random
        def self.random = Random.boolean
        def self.pass = true
        def self.failure = false
      end
    end
  end
end
