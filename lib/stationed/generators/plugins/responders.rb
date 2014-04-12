module Stationed
  module Generators
    module Plugins
      module Responders
        def self.prepended(base)
          base.class_option :responders,
            type: :boolean,
            default: true,
            desc: 'Add and configure Responders gem for DRY controllers'
        end

        def finish_template
          return super unless options[:responders]
          gem 'responders'
          copy_file 'application_responder.rb', 'lib/application_responder.rb'

          inject_into_class 'app/controllers/application_controller.rb', 'ApplicationController' do
            <<-RUBY
  self.responder = ApplicationResponder
  respond_to :html

            RUBY
          end

          application do
            <<-RUBY
# Enable auto-loading from ./lib
    config.autoload_paths << Rails.root.join('lib')
            RUBY
          end
          super
        end
      end
    end
  end
end
