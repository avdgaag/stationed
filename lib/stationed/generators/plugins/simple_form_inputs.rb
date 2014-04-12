module Stationed
  module Generators
    module Plugins
      module SimpleFormInputs
        def self.prepended(base)
          base.class_option :simple_form_inputs,
            type: :boolean,
            default: true,
            desc: 'Install custom simple_form inputs'
        end

        def finish_template
          return super unless options[:simple_form] && options[:simple_form_inputs]
          copy_file 'static_input.rb', 'app/inputs/static_input.rb'
          copy_file 'select2_input.rb', 'app/inputs/select2_input.rb'
          super
        end
      end
    end
  end
end
