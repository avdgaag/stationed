module Stationed
  module Generators
    module Plugins
      module DatabaseCleaner
        def finish_template
          gem 'database_cleaner', group: :test
          copy_file 'database_cleaner.rb', 'spec/support/database_cleaner.rb'
          super
        end
      end
    end
  end
end
