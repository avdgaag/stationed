module Stationed
  # Base class for CRUD-style tags
  class CrudTag
    attr_reader :context, :method, :resource, :model

    def initialize(context, method, resource, options = {})
      @context  = context
      @method   = method
      @resource = resource
      @model    = Array(resource).last
      @options  = options
    end

    def index
      context.send method, label(:index), model, options
    end

    def new
      *nested_parts, _ = Array(resource)
      context.send method, label(:new), [:new, *nested_parts, model_name.singular], options
    end

    def show
      context.send method, label(:show), [*resource], options
    end

    def edit
      context.send method, label(:edit), [:edit, *resource], options
    end

    def destroy
      context.send method, label(:destroy), [*resource], options.merge(data: { method: :delete })
    end

    private

    def options
      default_options.merge(@options)
    end

    def model_name
      @model_name ||=
        if @model.respond_to?(:model_name)
          @model.model_name
        elsif @model.class.respond_to?(:model_name)
          @model.class.model_name
        else
          fail ArgumentError,
               'Pass in an ActiveModel-compliant record or class'
        end
    end

    def default_options
      {}
    end

    def label(action)
      context.translate(
        :"helpers.buttons.#{model_name.i18n_key}.#{action}",
        default: [
          :"helpers.buttons.defaults.#{action}",
          "#{action.capitalize} %{model}"
        ],
        model: model_name.human,
        plural: model_name.human.pluralize,
        id: model.to_param
      )
    end
  end
end
