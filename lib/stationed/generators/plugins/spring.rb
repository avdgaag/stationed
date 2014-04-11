module Stationed
  module Generators
    module Plugins
      module Spring
        def finish_template
          gem 'spring-commands-rspec', group: :development
          copy_file 'spring.rb', 'config/spring.rb'
          super
        end
      end
    end
  end
end
