module Stationed
  module Generators
    module Plugins
      module CapybaraWebkit
        def self.prepended(base)
          base.class_option :capybara_webkit,
            type: :boolean,
            default: true,
            desc: 'Include CapybaraWebkit for headless browser testing'
        end

        def finish_template
          return super unless options[:capybara] && options[:capybara_webkit]
          gem 'capybara-webkit', group: :test
          copy_file 'capybara_webkit.rb', 'spec/support/capybara_webkit.rb'
          super
        end
      end
    end
  end
end

