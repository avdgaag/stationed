module Stationed
  module Generators
    module Plugins
      module Layout
        def finish_template
          remove_file 'app/views/layouts/application.html.haml'
          copy_file 'application.html.haml', 'app/views/layouts/application.html.haml'
          super
        end
      end
    end
  end
end
