module Stationed
  module Generators
    module Plugins
      module DatabaseCleaner
        def self.prepended(base)
          base.class_option :database_cleaner,
            type: :boolean,
            default: true,
            desc: 'Replace transactional fixtures with DatabaseCleaner'
        end

        def finish_template
          return super unless options[:database_cleaner]
          gem 'database_cleaner', group: :test
          copy_file 'database_cleaner.rb', 'spec/support/database_cleaner.rb'
          super
        end
      end
    end
  end
end
