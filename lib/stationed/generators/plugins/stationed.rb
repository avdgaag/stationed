module Stationed
  module Generators
    module Plugins
      module Stationed
        def self.prepended(base)
          base.class_option :stationed,
            type: :boolean,
            default: true,
            desc: 'Include stationed itself as an engine'
        end

        def finish_template
          return super unless options[:stationed]
          gem 'stationed', path: '~/code/stationed'
          super
        end
      end
    end
  end
end
