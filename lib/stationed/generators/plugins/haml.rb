module Stationed
  module Generators
    module Plugins
      module Haml
        def self.prepended(base)
          base.class_option :haml,
            type: :boolean,
            default: true,
            desc: 'Include Haml as template engine'
        end

        def finish_template
          return super unless options[:haml]
          gem 'haml-rails'
          super
        end
      end
    end
  end
end
