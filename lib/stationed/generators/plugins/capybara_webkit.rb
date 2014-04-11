module Stationed
  module Generators
    module Plugins
      module CapybaraWebkit
        def finish_template
          gem 'capybara-webkit', group: :test
          copy_file 'capybara_webkit.rb', 'spec/support/capybara_webkit.rb'
          super
        end
      end
    end
  end
end

