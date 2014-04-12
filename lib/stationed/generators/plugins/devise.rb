module Stationed
  module Generators
    module Plugins
      module Devise
        def self.prepended(base)
          base.class_option :devise,
            type: :boolean,
            default: true,
            desc: 'Set up authentication with Devise'
        end

        def finish_template
          return super unless options[:devise]
          gem 'devise'
          copy_file 'devise.rb', 'spec/support/devise.rb' if options[:rspec]
          route "devise_scope :user do\n    root to: 'devise/sessions#new'\n  end\n"
          environment nil, env: :test do
            "config.action_mailer.default_url_options = { host: 'example.com' }"
          end
          environment nil, env: :development do
            "config.action_mailer.default_url_options = { host: 'localhost:3000' }"
          end
          super
        end

        def run_bundle
          super
          return unless options[:devise]
          generate 'devise:install'
          generate 'devise user'
          return unless options[:pundit]
          application do
            <<-RUBY
# Let Pundit authorization or custom responders not influence the workings
    # of Devise.
    config.to_prepare do
      [
        Devise::SessionsController,
        Devise::RegistrationsController,
        Devise::PasswordsController
      ].each do |devise_controller_class|
        devise_controller_class.skip_after_action :verify_authorized
        devise_controller_class.skip_after_action :verify_policy_scoped
        devise_controller_class.responder = ActionController::Responder
      end
    end
            RUBY
          end
        end
      end
    end
  end
end
