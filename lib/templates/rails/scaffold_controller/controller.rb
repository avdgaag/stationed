<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  respond_to :html, :json
  before_action :set_<%= singular_table_name %>, only: %i[show edit update destroy]

  def index
    @<%= plural_table_name %> = policy_scope(<%= orm_class.all(class_name) %>).decorate
    respond_with @<%= plural_table_name %>
  end

  def show
    authorize @<%= singular_table_name %>
    respond_with @<%= singular_table_name %>
  end

  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>.decorate
    authorize @<%= singular_table_name %>
    respond_with @<%= singular_table_name %>
  end

  def edit
    authorize @<%= singular_table_name %>
    respond_with @<%= singular_table_name %>
  end

  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %>
    authorize @<%= singular_table_name %>
    @<%= orm_instance.save %>
    respond_with @<%= singular_table_name %>
  end

  def update
    authorize @<%= singular_table_name %>
    @<%= orm_instance.update("#{singular_table_name}_params") %>
    respond_with @<%= singular_table_name %>
  end

  def destroy
    authorize @<%= singular_table_name %>
    @<%= orm_instance.destroy %>
    respond_with @<%= singular_table_name %>
  end

  private

  def set_<%= singular_table_name %>
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>.decorate
  end

  def <%= "#{singular_table_name}_params" %>
    <%- if attributes_names.empty? -%>
    params[<%= ":#{singular_table_name}" %>]
    <%- else -%>
    params.require(<%= ":#{singular_table_name}" %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
    <%- end -%>
  end
end
<% end -%>
