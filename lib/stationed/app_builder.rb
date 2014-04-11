module Stationed
  class AppBuilder < Rails::AppBuilder
    def readme
      template 'README.md.erb', 'README.md'
    end

    def database_yml
      super
      append_to_file '.gitignore', "config/database.yml\n"
      template "config/databases/#{options[:database]}.yml", "config/database.yml.example"
    end
  end
end
