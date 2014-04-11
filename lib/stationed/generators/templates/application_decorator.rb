class ApplicationDecorator < Draper::Decorator
  # Always use our custom PaginatingDecorator to decorate ActiveRelation
  # objects so we can properly delegate Kaminari's pagination extensions.
  def self.collection_decorator_class
    PaginatingDecorator
  end

  # Override Haml's default object notation to use the class name
  # it would have used had an object not been decorated.
  #
  # This removes the need for markup like:
  #
  #     %div[person.person]
  #       ...
  #
  # Instead allowing:
  #
  #     %div[person]
  #       ...
  def haml_object_ref
    model.class.to_s.underscore
  end
end
