require 'spec_helper'

describe PlaceholderHelper do
  before do
    allow(helper).to receive(:controller_name).and_return('products')
    allow(helper).to receive(:action_name).and_return('index')
  end

  it 'fetches default key by controller action first' do
    I18n.backend.store_translations :en, placeholders: { products: { index: 'Nothing found' } }
    expect(helper.placeholder).to eql('<p class="placeholder">Nothing found</p>')
  end

  it 'fetches default key by controller second' do
    I18n.backend.store_translations :en, placeholders: { products: { default: 'Nothing found' } }
    expect(helper.placeholder).to eql('<p class="placeholder">Nothing found</p>')
  end

  it 'fetches default key by action third' do
    I18n.backend.store_translations :en, placeholders: { defaults: { index: 'Nothing found' } }
    expect(helper.placeholder).to eql('<p class="placeholder">Nothing found</p>')
  end

  it 'fetches custom default key' do
    I18n.backend.store_translations :en, placeholders: { defaults: { foo: 'Nothing found' } }
    expect(helper.placeholder(:foo)).to eql('<p class="placeholder">Nothing found</p>')
  end

  it 'uses plain string' do
    expect(helper.placeholder('Nothing found')).to eql('<p class="placeholder">Nothing found</p>')
  end

  it 'allows using a custom tag' do
    expect(helper.placeholder('Nothing found', tag: :span)).to eql('<span class="placeholder">Nothing found</span>')
  end
end
