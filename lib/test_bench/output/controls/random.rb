module TestBench
  module Output
    module Controls
      module Random
        def self.string = base36

        def self.base36 = integer.to_s(36)

        def self.boolean
          if integer % 2 == 1
            true
          else
            false
          end
        end

        def self.integer
          bytes = generator.bytes(8).bytes

          number = 0

          bytes.each_with_index do |byte, index|
            number += byte ** index
          end

          number
        end

        def self.float
          generator.rand
        end

        def self.generator
          @generator ||=
            begin
              seed = ENV['CONTROL_SEED']

              if seed.nil?
                ::Random.new
              else
                ::Random.new(seed.to_i)
              end
            end
        end
      end
    end
  end
end
