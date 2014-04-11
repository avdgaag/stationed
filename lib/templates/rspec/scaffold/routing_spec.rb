require 'spec_helper'

<% module_namespacing do -%>
describe <%= controller_class_name %>Controller do
  describe 'routing' do
<% unless options[:singleton] -%>
    it { expect(get: '/<%= ns_table_name %>').to route_to('<%= ns_table_name %>#index') }
<% end -%>
    it { expect(get: '/<%= ns_table_name %>/new').to route_to('<%= ns_table_name %>#new') }
    it { expect(get: '/<%= ns_table_name %>/1').to route_to('<%= ns_table_name %>#show', id: '1') }
    it { expect(get: '/<%= ns_table_name %>/1/edit').to route_to('<%= ns_table_name %>#edit', id: '1') }
    it { expect(post: '/<%= ns_table_name %>').to route_to('<%= ns_table_name %>#create') }
    it { expect(put: '/<%= ns_table_name %>/1').to route_to('<%= ns_table_name %>#update', id: '1') }
    it { expect(delete: '/<%= ns_table_name %>/1').to route_to('<%= ns_table_name %>#destroy', id: '1') }
  end
end
<% end -%>
