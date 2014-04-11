module Stationed
  module Generators
    module Plugins
      module FactoryGirl
        def finish_template
          gem 'factory_girl_rails', group: [:development, :test]
          copy_file 'factory_girl.rb', 'spec/support/factory_girl.rb'
          copy_file 'factories_spec.rb', 'spec/models/factories_spec.rb'
          super
        end
      end
    end
  end
end
