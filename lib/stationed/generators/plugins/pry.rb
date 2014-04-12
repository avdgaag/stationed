module Stationed
  module Generators
    module Plugins
      module Pry
        def self.prepended(base)
          base.class_option :pry,
            type: :boolean,
            default: true,
            desc: 'Include Pry debugging gems'
        end

        def finish_template
          return super unless options[:pry]
          gem_group :development, :test do
            gem 'pry-rails'
            gem 'pry-byebug'
            gem 'pry-stack_explorer'
            gem 'better_errors'
            gem 'binding_of_caller'
          end
          super
        end
      end
    end
  end
end

