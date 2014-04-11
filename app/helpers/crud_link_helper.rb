require 'stationed/crud_tag'

# Provides links to CRUD-style operations for resources.
#
# @see CrudTag
module CrudLinkHelper
  %i(new edit show index destroy).each do |action|
    define_method :"link_to_#{action}" do |*args|
      Stationed::CrudTag.new(self, :link_to, *args).send action
    end

    define_method :"button_to_#{action}" do |*args|
      Stationed::CrudTag.new(self, :button_to, *args).send action
    end

    define_method :"button_link_to_#{action}" do |*args|
      options = args.extract_options!
      options.reverse_merge! class: 'button'
      Stationed::CrudTag.new(self, :link_to, *args, options).send action
    end
  end
end
