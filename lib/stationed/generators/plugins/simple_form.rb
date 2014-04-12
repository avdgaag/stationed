module Stationed
  module Generators
    module Plugins
      module SimpleForm
        def self.prepended(base)
          base.class_option :simple_form,
            type: :boolean,
            default: true,
            desc: 'Include and configure simple_form as FormBuilder'
        end

        def finish_template
          return super unless options[:simple_form]
          gem 'simple_form'
          super
        end

        def run_bundle
          super
          return unless options[:simple_form]
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
