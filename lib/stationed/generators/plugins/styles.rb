module Stationed
  module Generators
    module Plugins
      module Styles
        def finish_template
          gem 'bourbon'
          gem 'neat'
          gem 'bitters'
          remove_file 'app/assets/stylesheets/application.css'
          copy_file 'application.scss', 'app/assets/stylesheets/application.scss'
          copy_file 'layout.scss', 'app/assets/stylesheets/_layout.scss'
          super
        end

        def run_bundle
          super
          run 'bitters install'
          FileUtils.mv 'bitters', 'app/assets/stylesheets/bitters'
          gsub_file 'app/assets/stylesheets/bitters/_bitters.scss', %r{// @import}, '@import'
        end
      end
    end
  end
end
