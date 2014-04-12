module Stationed
  module Generators
    module Plugins
      module Foreman
        def self.prepended(base)
          base.class_option :foreman,
            type: :boolean,
            default: true,
            desc: 'Configure Foreman with a Procfile and .env file'
        end

        def finish_template
          return super unless options[:foreman]
          gem 'foreman'
          gem 'dotenv-rails'
          copy_file 'Procfile', 'Procfile'
          template 'env.erb', '.env'
          super
        end
      end
    end
  end
end
