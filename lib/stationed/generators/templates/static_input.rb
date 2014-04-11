# Special kind of input field that shows the editable value as plain text, not
# with a form widget. Handy when you want to indicate the field is not
# editable.
#
# @example
#   f.input :my_attribute, as: :static
class StaticInput < SimpleForm::Inputs::Base
  def input
    content_tag :span, object.send(attribute_name), class: 'static-field'
  end
end
