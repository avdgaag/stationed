require 'rails/generators'
require 'rails/generators/rails/app/app_generator'
require 'stationed/app_builder'
require 'stationed/generators/plugins'

module Stationed
  module Generators
    class AppGenerator < Rails::Generators::AppGenerator
      source_root File.expand_path('../templates', __FILE__)
      source_paths << Rails::Generators::AppGenerator.source_root
      source_paths << source_root

      prepend Plugins::Rubocop
      prepend Plugins::Pry
      prepend Plugins::Guard
      prepend Plugins::Rspec
      prepend Plugins::FactoryGirl
      prepend Plugins::DatabaseCleaner
      prepend Plugins::Capybara
      prepend Plugins::CapybaraWebkit
      prepend Plugins::Pundit
      prepend Plugins::Yard
      prepend Plugins::Foreman
      prepend Plugins::Styles
      prepend Plugins::Draper
      prepend Plugins::Wiki
      prepend Plugins::Generators
      prepend Plugins::Devise
      prepend Plugins::Turbolinks
      prepend Plugins::Kaminari
      prepend Plugins::SimpleForm
      prepend Plugins::Haml
      prepend Plugins::StrongParameters
      prepend Plugins::RackDeflater
      prepend Plugins::Flashes
      prepend Plugins::Webmock
      prepend Plugins::Layout
      prepend Plugins::Normalize
      prepend Plugins::I18nSpec
      prepend Plugins::SimpleFormInputs
      prepend Plugins::Spring
      prepend Plugins::Stationed
      prepend Plugins::Responders

      protected

      def get_builder_class
        Stationed::AppBuilder
      end
    end
  end
end
