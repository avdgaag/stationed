module Stationed
  module Generators
    module Plugins
      module Poltergeist
        def self.prepended(base)
          base.class_option :poltergeist,
            type: :boolean,
            default: true,
            desc: 'Include Poltergeist for headless browser testing'
        end

        def finish_template
          return super unless options[:capybara] && options[:poltergeist]
          gem 'poltergeist', group: :test
          copy_file 'poltergeist.rb', 'spec/support/poltergeist.rb'
          super
        end
      end
    end
  end
end
