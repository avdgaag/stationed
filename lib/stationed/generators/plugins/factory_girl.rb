module Stationed
  module Generators
    module Plugins
      module FactoryGirl
        def self.prepended(base)
          base.class_option :factory_girl,
            type: :boolean,
            default: true,
            desc: 'Include FactoryGirl and default tests for valid factories'
        end

        def finish_template
          return super unless options[:factory_girl]
          gem 'factory_girl_rails', group: [:development, :test]
          copy_file 'factory_girl.rb', 'spec/support/factory_girl.rb'
          copy_file 'factories_spec.rb', 'spec/models/factories_spec.rb'
          super
        end
      end
    end
  end
end
