module PageTitleHelper
  # Sets or retrieves the current page title.
  #
  # * When given no argument, this will return the currently set page title or
  #   the site-wide default.
  # * When given a string argument, that will be used in the formatted page
  #   title (for example with a site-wide suffix).
  # * When given an ActiveModel-compliant object, its singular and plural human
  #   names will be interpolated into the model-based title template, along
  #   with the record's ID.
  #
  # You can provide templates for page titles using `I18n` in three broad
  # categories: the `model`, `formatted` and `standard` keys. These will be
  # used when you set a page title via a model, string or nothing at all,
  # respectively.
  #
  # You can specify these translation keys on a global default level, per
  # controller or per controller action. The more specific key will take
  # precedence.
  #
  # @example Set the page title to a string
  #   page_title 'Welcome'
  # @example Set the page title based on a model name
  #   page_title Post.find(1)
  #   # example translation key: 'Editing %{singular} %{id}'
  # @example Pass along extra arguments to interpolate
  #   page_title @post, author: @post.author.name
  # @example Show the page title
  #   <title><%= title %></title>
  #
  # @param [String, #model_name] String or ActiveModel-compliant object
  # @return [String] page title component or formatted page title
  def page_title(new_title = nil, options = {})
    if new_title
      title_from_string_or_record_or_class(new_title, options).tap do |str|
        content_for :page_title, str
      end
    elsif content_for? :page_title
      formatted_title
    else
      standard_title
    end
  end

  private

  def standard_title
    I18n.translate(
      standard_defaults.first,
      default: standard_defaults.drop(1)
    )
  end

  def formatted_title
    I18n.translate(
      formatted_defaults.first,
      title:   content_for(:page_title),
      default: formatted_defaults.drop(1)
    )
  end

  def title_for_class(klass, options = {})
    options.reverse_merge!(
      default:  model_defaults.drop(1),
      singular: klass.model_name.human,
      plural:   klass.model_name.human.pluralize
    )
    I18n.translate model_defaults.first, options
  end

  def title_from_string_or_record_or_class(object, options)
    if object.respond_to?(:model_name)
      title_for_class(object, options)
    elsif object.class.respond_to?(:model_name)
      title_for_class(object.class, options.reverse_merge(id: object.to_param))
    else
      object
    end
  end

  def formatted_defaults
    [
      :"page_title.#{controller_name}.#{action_name}.formatted",
      :"page_title.#{controller_name}.formatted",
      :'page_title.default.formatted',
      :'page_title.default.standard',
      ::Rails.application.class.parent_name
    ]
  end

  def standard_defaults
    [
      :"page_title.#{controller_name}.#{action_name}.standard",
      :"page_title.#{controller_name}.standard",
      :'page_title.default.standard',
      ::Rails.application.class.parent_name
    ]
  end

  def model_defaults
    [
      :"page_title.#{controller_name}.#{action_name}.model",
      :"page_title.#{controller_name}.model",
      :'page_title.default.model',
      :'page_title.default.standard',
      ::Rails.application.class.parent_name
    ]
  end
end
