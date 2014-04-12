module Stationed
  module Generators
    module Plugins
      module Styles
        def self.prepended(base)
          base.class_option :styles,
            type: :boolean,
            default: true,
            desc: 'Include Bourbon, Neat, Bitters and Normalize.css'
        end

        def finish_template
          return super unless options[:styles]
          gem 'bourbon'
          gem 'neat'
          gem 'bitters'
          remove_file 'app/assets/stylesheets/application.css'
          copy_file 'application.scss', 'app/assets/stylesheets/application.scss'
          copy_file 'layout.scss', 'app/assets/stylesheets/_layout.scss'
          copy_file 'normalize.css', 'vendor/assets/stylesheets/normalize.css'
          super
        end

        def run_bundle
          super
          return unless options[:styles]
          run 'bitters install'
          FileUtils.mv 'bitters', 'app/assets/stylesheets/bitters'
          gsub_file 'app/assets/stylesheets/bitters/_bitters.scss', %r{// @import}, '@import'
        end
      end
    end
  end
end
