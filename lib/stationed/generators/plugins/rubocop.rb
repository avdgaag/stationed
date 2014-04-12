module Stationed
  module Generators
    module Plugins
      module Rubocop
        def self.prepended(base)
          base.class_option :rubocop,
            type: :boolean,
            default: true,
            desc: 'Include configuration and tasks to run Rubocop.'
        end

        def finish_template
          return super unless options[:rubocop]
          gem 'rubocop', group: :development
          copy_file 'rubocop.rake', 'lib/tasks/rubocop.rake'
          copy_file 'rubocop.yml', '.rubocop.yml'
          super
        end
      end
    end
  end
end
