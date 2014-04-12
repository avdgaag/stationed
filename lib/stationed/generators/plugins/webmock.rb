module Stationed
  module Generators
    module Plugins
      module Webmock
        def self.prepended(base)
          base.class_option :webmock,
            type: :boolean,
            default: true,
            desc: 'Install webmock to prevent external HTTP requests in tests'
        end

        def finish_template
          return super unless options[:webmock]
          gem 'webmock', group: :test
          copy_file 'webmock.rb', 'spec/support/webmock.rb'
          super
        end
      end
    end
  end
end
