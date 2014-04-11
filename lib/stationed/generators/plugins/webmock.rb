module Stationed
  module Generators
    module Plugins
      module Webmock
        def finish_template
          gem 'webmock', group: :test
          copy_file 'webmock.rb', 'spec/support/webmock.rb'
          super
        end
      end
    end
  end
end
