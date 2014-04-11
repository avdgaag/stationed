module Stationed
  module Generators
    module Plugins
      module Kaminari
        def finish_template
          gem 'kaminari'
          super
        end

        def run_bundle
          super
          generate 'kaminari:config'
          generate 'kaminari:views default'
        end
      end
    end
  end
end
