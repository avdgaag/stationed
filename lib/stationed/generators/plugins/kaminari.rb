module Stationed
  module Generators
    module Plugins
      module Kaminari
        def self.prepended(base)
          base.class_option :kaminari,
            type: :boolean,
            default: true,
            desc: 'Include Kaminari with config and views for pagination'
        end

        def finish_template
          return super unless options[:kaminari]
          gem 'kaminari'
          super
        end

        def run_bundle
          super
          return unless options[:kaminari]
          generate 'kaminari:config'
          generate 'kaminari:views default'
        end
      end
    end
  end
end
