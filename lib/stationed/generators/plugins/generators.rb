module Stationed
  module Generators
    module Plugins
      module Generators
        def finish_template
          copy_file 'generators.rb', 'config/initializers/generators.rb'
          super
        end
      end
    end
  end
end
