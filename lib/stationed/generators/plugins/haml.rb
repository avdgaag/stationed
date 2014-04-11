module Stationed
  module Generators
    module Plugins
      module Haml
        def finish_template
          gem 'haml-rails'
          super
        end
      end
    end
  end
end
