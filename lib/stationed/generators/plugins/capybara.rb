module Stationed
  module Generators
    module Plugins
      module Capybara
        def self.prepended(base)
          base.class_option :capybara,
            type: :boolean,
            default: true,
            desc: 'Include Capybara'
        end

        def finish_template
          return super unless options[:capybara]
          gem 'capybara', group: :test
          super
        end
      end
    end
  end
end
