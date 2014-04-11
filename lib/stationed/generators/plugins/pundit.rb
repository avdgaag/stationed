module Stationed
  module Generators
    module Plugins
      module Pundit
        def finish_template
          gem 'pundit'
          copy_file 'pundit.rb', 'spec/support/pundit.rb'
          copy_file 'authorization.rb', 'app/controllers/concerns/authorization.rb'
          inject_into_class 'app/controllers/application_controller.rb', 'ApplicationController', "\n  include Authorization\n\n"
          super
        end

        def run_bundle
          super
          generate 'pundit:install'
        end
      end
    end
  end
end
