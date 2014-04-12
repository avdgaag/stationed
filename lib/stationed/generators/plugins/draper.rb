module Stationed
  module Generators
    module Plugins
      module Draper
        def self.prepended(base)
          base.class_option :draper,
            type: :boolean,
            default: true,
            desc: 'Include and configure draper for view decorators'
        end

        def finish_template
          return super unless options[:draper]
          gem 'draper'
          copy_file 'application_decorator.rb', 'app/decorators/application_decorator.rb'
          copy_file 'paginating_decorator.rb', 'app/decorators/paginating_decorator.rb'
          super
        end
      end
    end
  end
end
