module TestBench
  module Output
    module Controls
      module Path
        def self.example(suffix=nil)
          suffix = "_#{suffix}" if not suffix.nil?

          "path/to/some_file#{suffix}.rb"
        end

        module Random
          def random = example(Controls::Random.string)
        end
        extend Random

        module Absolute
          extend Random

          def self.example(suffix=nil)
            path = Path.example(suffix)

            File.join('/', path)
          end

          module Local
            extend Random

            def self.example(suffix=nil)
              path = Path.example(suffix)

              File.join(current_dir, path)
            end

            def self.current_dir
              File.join('/home', 'some-user', 'some-working-dir')
            end

            module Gem
              extend Random

              def self.example(path=nil)
                path ||= Path.example

                path = File.join(gems_path, path)

                Local.example(path)
              end

              def self.gems_path
                ruby_version = RbConfig::CONFIG['ruby_version']

                "gems/ruby/#{ruby_version}/gems"
              end
            end
          end
        end
      end
    end
  end
end
