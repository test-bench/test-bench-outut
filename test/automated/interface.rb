require_relative 'automated_init'

context "Interface" do
  output = Controls::Output.example

  Controls::Output::Exercise.(output) do |method_name, arguments|
    arguments = arguments.map(&:inspect)

    comment "Invoked method: #{method_name}(#{arguments.join(', ')})"
  end
end
