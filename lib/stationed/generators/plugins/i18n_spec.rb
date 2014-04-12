module Stationed
  module Generators
    module Plugins
      module I18nSpec
        def self.prepended(base)
          base.class_option :i18n_spec,
            type: :boolean,
            default: true,
            desc: 'Set up tests for locale files'
        end

        def finish_template
          return super unless options[:i18n_spec]
          gem 'i18n-spec', group: :test
          copy_file 'i18n_spec.rb', 'spec/locales/i18n_spec.rb'
          super
        end
      end
    end
  end
end
