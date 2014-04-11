module Stationed
  module Generators
    module Plugins
    end
  end
end

Dir.glob(File.expand_path('../plugins/*.rb', __FILE__)).each do |filename|
  require filename
end
