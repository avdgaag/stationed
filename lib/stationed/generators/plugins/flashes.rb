module Stationed
  module Generators
    module Plugins
      module Flashes
        def self.prepended(base)
          base.class_option :flashes,
            type: :boolean,
            default: true,
            desc: 'Include generic flashes partial'
        end

        def finish_template
          return super unless options[:flashes] && options[:layout]
          copy_file 'flashes.html.haml', 'app/views/application/_flashes.html.haml'
          super
        end
      end
    end
  end
end
