module Stationed
  module Generators
    module Plugins
      module Rspec
        def self.prepended(base)
          base.class_option :rspec,
            type: :boolean,
            default: true,
            desc: 'Generate configuration for Rspec with Simplecov'
        end

        def finish_template
          return super unless options[:rspec]
          gem 'simplecov', group: :test
          gem 'rspec-rails', group: [:development, :test]
          copy_file 'simplecov', '.simplecov'
          super
        end

        def run_bundle
          super
          return unless options[:rspec]
          generate 'rspec:install'
          remove_file 'spec/spec_helper.rb'
          copy_file 'spec_helper.rb', 'spec/spec_helper.rb'
        end
      end
    end
  end
end
