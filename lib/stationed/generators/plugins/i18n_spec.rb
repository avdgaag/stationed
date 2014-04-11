module Stationed
  module Generators
    module Plugins
      module I18nSpec
        def finish_template
          gem 'i18n-spec', group: :test
          copy_file 'i18n_spec.rb', 'spec/locales/i18n_spec.rb'
          super
        end
      end
    end
  end
end
