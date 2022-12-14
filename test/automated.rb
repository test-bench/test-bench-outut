require_relative 'test_init'

if ENV['BOOTSTRAP'] == 'on'
  TestBench::Bootstrap::Run.()
else
  TestBench::Run.(
    'test/automated',
    exclude_file_pattern: '**/{_*,sketch*,*_init.rb,*_tests.rb}'
  ) or exit(false)
end
