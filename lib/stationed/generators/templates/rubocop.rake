begin
  require 'rubocop/rake_task'
  Rubocop::RakeTask.new
rescue LoadError
end
