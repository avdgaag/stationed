if Rails.env.development?
  require 'gollum/app'
  Precious::App.set :gollum_path, Rails.root
  Precious::App.set :wiki_options, page_file_dir: 'doc/wiki'
end
