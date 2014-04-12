module Stationed
  module Generators
    module Plugins
      module Turbolinks
        def self.prepended(base)
          base.class_option :turbolinks,
            type: :boolean,
            default: true,
            desc: 'Remove turbolinks from the generated project'
        end

        def finish_template
          return super unless options[:turbolinks]
          gsub_file 'Gemfile', /^gem 'turbolinks'.*\n/, ''
          gsub_file 'app/assets/javascripts/application.js', %r{//= require turbolinks\n}, ''
          super
        end
      end
    end
  end
end
