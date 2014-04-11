namespace :wiki do
  task :serve do
    sh 'gollum --page-file-dir doc/wiki'
  end
end
