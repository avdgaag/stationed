module Stationed
  module Generators
    module Plugins
      module Yard
        def self.prepended(base)
          base.class_option :yard,
            type: :boolean,
            default: true,
            desc: 'Include and configure Yard for API documentation'
        end

        def finish_template
          return super unless options[:yard]
          gem 'yard', require: false, group: :doc
          gem 'kramdown', require: false, group: :doc
          copy_file 'yardopts', '.yardopts'
          super
        end
      end
    end
  end
end
