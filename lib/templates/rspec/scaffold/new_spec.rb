<% output_attributes = attributes.reject{|attribute| [:datetime, :timestamp, :time, :date].index(attribute.type) } -%>
RSpec.describe "<%= ns_table_name %>/new", type: :view do
  let(:<%= ns_file_name %>) { build :<%= ns_file_name %> }

  before do
    assign :<%= ns_file_name %>, <%= ns_file_name %>
  end

  it "renders new <%= ns_file_name %> form" do
    render

    assert_select "form[action=?][method=?]", <%= index_helper %>_path, "post" do
<% for attribute in output_attributes -%>
      assert_select "<%= attribute.input_type -%>#<%= ns_file_name %>_<%= attribute.name %>[name=?]", "<%= ns_file_name %>[<%= attribute.name %>]"
<% end -%>
    end
  end
end
