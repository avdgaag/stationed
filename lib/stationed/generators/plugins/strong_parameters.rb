module Stationed
  module Generators
    module Plugins
      module StrongParameters
        def finish_template
          environment nil, env: :development do
            <<-RUBY
# Raise an ActionController::UnpermittedParameters exception when
# a parameter is not explcitly permitted but is passed anyway.
config.action_controller.action_on_unpermitted_parameters = :raise
            RUBY
          end
          super
        end
      end
    end
  end
end
