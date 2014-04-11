module Stationed
  module Generators
    module Plugins
      module Flashes
        def finish_template
          copy_file 'flashes.html.haml', 'app/views/application/_flashes.html.haml'
          super
        end
      end
    end
  end
end
