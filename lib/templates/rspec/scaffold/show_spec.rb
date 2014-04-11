require 'spec_helper'

describe "<%= ns_table_name %>/show" do
  let(:<%= ns_file_name %>) { build_stubbed :<%= ns_file_name %> }

  before do
    assign :<%= ns_file_name %>, <%= ns_file_name %>
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyString/)
  end
end
