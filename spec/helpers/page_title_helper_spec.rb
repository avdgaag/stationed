require 'spec_helper'

describe PageTitleHelper do
  before do
    allow(helper).to receive(:controller_name).and_return('controller')
    allow(helper).to receive(:action_name).and_return('action')
  end

  it 'stores a string as the page title' do
    expect(helper).to receive(:content_for).with(:page_title, 'bla')
    helper.page_title 'bla'
  end

  it 'interpolates id, plural and singular names into the formatted default given a record' do
    name   = double human: 'Post'
    model  = double model_name: name
    record = double class: model, to_param: '1'
    expect(I18n).to receive(:translate).with(
      :'page_title.controller.action.model',
      singular: 'Post',
      plural: 'Posts',
      id: '1',
      default: [
        :'page_title.controller.model',
        :'page_title.default.model',
        :'page_title.default.standard',
        'Dummy'
      ]
    ).and_return('bla')
    helper.page_title record
  end

  it 'passes additional options along to I18n.translate when setting a record title' do
    name   = double human: 'Post'
    model  = double model_name: name
    record = double class: model, to_param: '1'
    expect(I18n).to receive(:translate).with(
      :'page_title.controller.action.model',
      singular: 'Post',
      plural: 'Posts',
      id: '1',
      extra_argument: 'foobar',
      default: [
        :'page_title.controller.model',
        :'page_title.default.model',
        :'page_title.default.standard',
        'Dummy'
      ]
    ).and_return('bla')
    helper.page_title record, extra_argument: 'foobar'
  end

  it 'interpolates plural and singular names into the formatted default given a model' do
    name = double human: 'Post'
    model = double model_name: name
    expect(I18n).to receive(:translate).with(
      :'page_title.controller.action.model',
      singular: 'Post',
      plural: 'Posts',
      default: [
        :'page_title.controller.model',
        :'page_title.default.model',
        :'page_title.default.standard',
        'Dummy'
      ]
    ).and_return('bla')
    helper.page_title model
  end

  context 'when a title has been set' do
    before do
      helper.page_title 'bla'
    end

    it 'inserts it into the default format' do
      expect(I18n).to receive(:translate).with(
        :'page_title.controller.action.formatted',
        default: [
          :'page_title.controller.formatted',
          :'page_title.default.formatted',
          :'page_title.default.standard',
          'Dummy'
        ],
        title: 'bla'
      ).and_return('bla | site')
      expect(helper.page_title).to eql('bla | site')
    end
  end

  context 'when no title has been set' do
    it 'returns the default page title' do
      expect(I18n).to receive(:translate).with(
        :'page_title.controller.action.standard',
        default: [
          :'page_title.controller.standard',
          :'page_title.default.standard',
          'Dummy'
        ]
      ).and_return('bla')
      expect(helper.page_title).to eql('bla')
    end
  end
end
