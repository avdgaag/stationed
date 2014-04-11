# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.wrappers :default,
                  class: :input,
                  hint_class: :'field-with-hint',
                  error_class: :'field-with-errors' do |b|
    b.use :html5
    b.use :placeholder
    b.use :maxlength
    b.use :pattern
    b.use :min_max
    b.use :readonly
    b.use :label, wrap_with: { tag: :div, class: 'input-label' }

    b.wrapper tag: :div, class: 'input-field' do |c|
      c.use :input
      c.use :error, wrap_with: { tag: :div, class: :error }
      c.use :hint,  wrap_with: { tag: :div, class: :hint }
    end
  end

  config.wrappers :simple,
                  class: :input,
                  hint_class: :'field-with-hint',
                  error_class: :'field-with-errors' do |b|
    b.use :html5
    b.use :placeholder
    b.use :maxlength
    b.use :pattern
    b.use :min_max
    b.use :readonly
    b.use :label_input
    b.use :error, wrap_with: { tag: :div, class: :error }
    b.use :hint,  wrap_with: { tag: :div, class: :hint }
  end

  config.default_wrapper                   = :default
  config.boolean_style                     = :nested
  config.button_class                      = 'button'
  config.error_method                      = :to_sentence
  config.error_notification_tag            = :h2
  config.error_notification_class          = 'error-notification'
  # config.error_notification_id           = nil
  # config.collection_label_methods        = [ :to_label, :name, :title, :to_s ]
  # config.collection_value_methods        = [ :id, :to_s ]
  # config.collection_wrapper_tag          = nil
  # config.collection_wrapper_class        = nil
  # config.item_wrapper_tag                = :span
  # config.item_wrapper_class              = nil
  config.label_text                        = ->(label, required) { "#{label} #{required}" }
  # config.label_class                     = 'control-label'
  config.form_class                        = nil
  # config.generate_additional_classes_for = [:wrapper, :label, :input]
  # config.required_by_default             = true
  config.browser_validations               = false
  # config.file_methods                    = [ :mounted_as, :file?, :public_filename ]
  # config.input_mappings                  = { /count/                                      = > :integer }
  # config.wrapper_mappings                = { string: :prepend }
  # config.time_zone_priority              = nil
  # config.country_priority                = nil
  # config.translate_labels                = true
  config.inputs_discovery                  = true
  config.cache_discovery                   = !Rails.env.development?
  # config.input_class                     = nil
end
