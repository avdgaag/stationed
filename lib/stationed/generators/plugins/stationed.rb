module Stationed
  module Generators
    module Plugins
      module Stationed
        def finish_template
          gem 'stationed', path: '~/code/stationed'
          super
        end
      end
    end
  end
end
