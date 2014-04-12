module Stationed
  module Generators
    module Plugins
      module StrongParameters
        def self.prepended(base)
          base.class_option :strong_parameters,
            type: :boolean,
            default: true,
            desc: 'Be strict about strong parameters in development'
        end

        def finish_template
          returns uper unless options[:strong_parameters]
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
