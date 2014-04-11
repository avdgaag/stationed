module Stationed
  module Generators
    module Plugins
      module Turbolinks
        def finish_template
          gsub_file 'Gemfile', /^gem 'turbolinks'.*\n/, ''
          gsub_file 'app/assets/javascripts/application.js', %r{//= require turbolinks\n}, ''
          super
        end
      end
    end
  end
end
