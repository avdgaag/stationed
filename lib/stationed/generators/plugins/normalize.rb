module Stationed
  module Generators
    module Plugins
      module Normalize
        def finish_template
          copy_file 'normalize.css', 'vendor/assets/stylesheets/normalize.css'
          super
        end
      end
    end
  end
end
