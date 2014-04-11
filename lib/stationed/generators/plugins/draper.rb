module Stationed
  module Generators
    module Plugins
      module Draper
        def finish_template
          gem 'draper'
          copy_file 'application_decorator.rb', 'app/decorators/application_decorator.rb'
          copy_file 'paginating_decorator.rb', 'app/decorators/paginating_decorator.rb'
          super
        end
      end
    end
  end
end
