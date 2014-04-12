module Stationed
  module Generators
    module Plugins
      module Guard
        def self.prepended(base)
          base.class_option :guard,
            type: :boolean,
            default: true,
            desc: 'Include Guard for Rspec and Livereload'
        end

        def finish_template
          return super unless options[:guard]
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
          return unless options[:guard]
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
