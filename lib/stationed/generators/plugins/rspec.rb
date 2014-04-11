module Stationed
  module Generators
    module Plugins
      module Rspec
        def finish_template
          gem 'simplecov', group: :test
          gem 'rspec-rails', group: [:development, :test]
          copy_file 'simplecov', '.simplecov'
          super
        end

        def run_bundle
          super
          generate 'rspec:install'
          remove_file 'spec/spec_helper.rb'
          copy_file 'spec_helper.rb', 'spec/spec_helper.rb'
        end
      end
    end
  end
end
