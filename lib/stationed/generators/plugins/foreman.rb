module Stationed
  module Generators
    module Plugins
      module Foreman
        def finish_template
          gem 'foreman'
          gem 'yard', require: false, group: :doc
          copy_file 'Procfile', 'Procfile'
          template 'env.erb', '.env'
          super
        end
      end
    end
  end
end
