module Stationed
  module Generators
    module Plugins
      module Wiki
        def self.prepended(base)
          base.class_option :wiki,
            type: :boolean,
            default: true,
            desc: 'Include a Gollum-based stub Wiki in ./doc/wiki'
        end

        def finish_template
          return super unless options[:wiki]
          gem 'gollum', require: 'gollum/app', group: [:development]
          route "mount Precious::App => '/wiki' if defined?(Precious)"
          copy_file 'Home.md',       'doc/wiki/Home.md'
          copy_file 'Setup.md',      'doc/wiki/Setup.md'
          copy_file 'Testing.md',    'doc/wiki/Testing.md'
          copy_file 'Services.md',   'doc/wiki/Services.md'
          copy_file 'Deployment.md', 'doc/wiki/Deployment.md'
          copy_file 'gollum.rake',   'lib/tasks/gollum.rake'
          copy_file 'gollum.rb',     'config/initializers/gollum.rb'
          super
        end
      end
    end
  end
end
