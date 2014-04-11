module Stationed
  module Generators
    module Plugins
      module SimpleFormInputs
        def finish_template
          copy_file 'static_input.rb', 'app/inputs/static_input.rb'
          copy_file 'select2_input.rb', 'app/inputs/select2_input.rb'
          super
        end
      end
    end
  end
end
