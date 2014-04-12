begin
  require 'yard'
  namespace :doc do
    YARD::Rake::YardocTask.new
  end
rescue LoadError
end
