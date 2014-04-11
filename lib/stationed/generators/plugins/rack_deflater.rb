module Stationed
  module Generators
    module Plugins
      module RackDeflater
        def finish_template
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
