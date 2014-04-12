module Stationed
  module Generators
    module Plugins
      module Generators
        def self.prepended(base)
          base.class_option :generators,
            type: :boolean,
            default: true,
            desc: 'Set up default generators to disable helpers, assets, etc'
        end

        def finish_template
          return super unless options[:generators]
          copy_file 'generators.rb', 'config/initializers/generators.rb'
          super
        end
      end
    end
  end
end
