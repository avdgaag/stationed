module Stationed
  module Generators
    module Plugins
      module RackDeflater
        def self.prepended(base)
          base.class_option :rack_deflator,
            type: :boolean,
            default: true,
            desc: 'Include rack-deflator in production mode'
        end

        def finish_template
          return super unless options[:rack_deflator]
          environment nil, env: :production do
            <<-RUBY
  # Enable deflate / gzip compression of controller-generated responses
  config.middleware.use Rack::Deflater
            RUBY
          end
          super
        end
      end
    end
  end
end
