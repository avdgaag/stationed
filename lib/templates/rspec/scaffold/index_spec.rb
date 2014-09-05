RSpec.describe "<%= ns_table_name %>/index", type: :view do
  let(:<%= table_name %>) { build_stubbed_list :<%= ns_file_name %>, 3 }

  before do
    assign :<%= table_name %>, <%= table_name %>
    allow(view).to receive(:paginate).and_return('pagination')
  end

  it 'paginates the results' do
    expect(view).to receive(:paginate).with(<%= table_name %>)
    render
  end

  it "renders a list of <%= ns_table_name %>" do
    render
    assert_select 'tr>td', text: 'MyString'
  end
end
