RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  # config.before(:suite) do
  #   FactoryBot.definition_file_paths << Pathname.new(File.expand_path('../factories'))
  # end
end
