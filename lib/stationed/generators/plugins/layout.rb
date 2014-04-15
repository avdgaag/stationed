module Stationed
  module Generators
    module Plugins
      module Layout
        def self.prepended(base)
          base.class_option :layout,
            type: :boolean,
            default: true,
            desc: 'Add a generic Haml application layout file'
        end

        def finish_template
          return super unless options[:layout]
          remove_file 'app/views/layouts/application.html.erb'
          copy_file 'application.html.haml', 'app/views/layouts/application.html.haml'
          super
        end
      end
    end
  end
end
