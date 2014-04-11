# Simple custom select input control for SimpleForm that applies the select2
# javascript library for extra fanciness.
class Select2Input < SimpleForm::Inputs::CollectionSelectInput
  def input_options
    super.merge allow_blank: true
  end

  def input_html_options
    super.merge(
      style: 'width: 100%;',
      :'data-placeholder' => placeholder_text
    )
  end
end
