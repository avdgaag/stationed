module Stationed
  class Engine < ::Rails::Engine
    config.app_generators do |g|
      g.templates.unshift File.expand_path('../../templates', __FILE__)
      g.scaffold_controller :scaffold_controller
    end
  end
end
