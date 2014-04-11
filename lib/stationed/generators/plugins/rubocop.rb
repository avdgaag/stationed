module Stationed
  module Generators
    module Plugins
      module Rubocop
        def finish_template
          gem 'rubocop', group: :development
          copy_file 'rubocop.rake', 'lib/tasks/rubocop.rake'
          copy_file 'rubocop.yml', '.rubocop.yml'
          super
        end
      end
    end
  end
end
