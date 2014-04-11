module Stationed
  module Generators
    module Plugins
      module SimpleForm
        def finish_template
          gem 'simple_form'
          super
        end

        def run_bundle
          super
          generate 'simple_form:install'
          remove_file 'config/initializers/simple_form.rb'
          copy_file 'simple_form.rb', 'config/initializers/simple_form.rb'
          application do
            <<-RUBY
# Remove Rails' default error wrapper tags and rely solely on SimpleForm
    # and its generated markup.
    config.action_view.field_error_proc = lambda do |html_tag, instance|
      html_tag.html_safe
    end

    # Always use SimpleForm for forms without needing the simple_form_for
    # helper.
    config.action_view.default_form_builder = SimpleForm::FormBuilder
            RUBY
          end
        end
      end
    end
  end
end
