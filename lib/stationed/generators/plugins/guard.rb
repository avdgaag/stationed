module Stationed
  module Generators
    module Plugins
      module Guard
        def finish_template
          gem_group :development do
            gem 'guard'
            gem 'guard-rspec'
            gem 'guard-livereload'
            gem 'terminal-notifier-guard'
          end
          super
        end

        def run_bundle
          super
          run 'bundle exec guard init rspec'
          run 'bundle exec guard init livereload'
          gsub_file 'Guardfile',
                    /guard :rspec do/,
                    "guard :rspec, cmd: 'spring rspec' do"
        end
      end
    end
  end
end
