module Stationed
  module Generators
    module Plugins
      module Pundit
        def self.prepended(base)
          base.class_option :pundit,
            type: :boolean,
            default: true,
            desc: 'Include and configure Pundit for authorization'
        end

        def finish_template
          return super unless options[:pundit]
          gem 'pundit'
          copy_file 'pundit.rb', 'spec/support/pundit.rb'
          copy_file 'authorization.rb', 'app/controllers/concerns/authorization.rb'
          inject_into_class 'app/controllers/application_controller.rb', 'ApplicationController', "\n  include Authorization\n\n"
          super
        end

        def run_bundle
          super
          return unless options[:pundit]
          generate 'pundit:install'
        end
      end
    end
  end
end
