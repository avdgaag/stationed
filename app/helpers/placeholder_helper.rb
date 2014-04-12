# Provides the `placeholder` helper method for showing standard markup
# for when thing are missing or not present yet.
module PlaceholderHelper
  # Display a placeholder message using standardized markup and a message
  # defined through I18n.
  #
  # When in a controller PostsController and action index, this will try
  # to look up the following placeholder keys:
  #
  # * placeholders.posts.index
  # * placeholders.posts.default
  # * placeholders.defaults.index
  #
  # You can also provide an argument to set the placeholder message. When given
  # a string, it will be used directly as the placeholder message. When given a
  # symbol, that key will be looked up in the `placeholders.defaults` namespace
  # using I18n.
  #
  # @return [String] e.g. '<p class="placeholder">Nothing to show</p>'
  def placeholder(label = nil, tag: :p)
    content_tag(tag, placeholder_text(label), class: 'placeholder')
  end

  private

  def placeholder_text(label)
    case label
    when Symbol
      defaults = [
        :"placeholders.defaults.#{label}",
        :'placeholders.defaults.default'
      ]
      translate(defaults.shift, default: defaults)
    when nil
      defaults = [
        :"placeholders.#{controller_name}.#{action_name}",
        :"placeholders.#{controller_name}.default",
        :"placeholders.defaults.#{action_name}"
      ]
      translate defaults.shift, default: defaults
    else
      label.to_s
    end
  end
end
