module Stationed
  module Generators
    module Plugins
      module Pry
        def finish_template
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

