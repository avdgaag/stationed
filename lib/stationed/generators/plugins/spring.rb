module Stationed
  module Generators
    module Plugins
      module Spring
        def self.prepended(base)
          base.class_option :spring,
            type: :boolean,
            default: true,
            desc: 'Add Rspec spring commands and configuration'
        end

        def finish_template
          return super unless options[:spring]
          gem 'spring-commands-rspec', group: :development
          copy_file 'spring.rb', 'config/spring.rb'
          super
        end
      end
    end
  end
end
