module Stationed
  module Generators
    module Plugins
      module Capybara
        def finish_template
          gem 'capybara', group: :test
          super
        end
      end
    end
  end
end
