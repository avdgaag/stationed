module Stationed
  module Generators
    module Plugins
      module Yard
        def finish_template
          gem 'yard', require: false, group: :doc
          gem 'kramdown', require: false, group: :doc
          copy_file 'yardopts', '.yardopts'
          super
        end
      end
    end
  end
end
