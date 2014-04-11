require 'spec_helper'

describe 'factories' do
  FactoryGirl.factories.map(&:name).each do |factory_name|
    specify "#{factory_name} factory is valid", :factory do
      factory = build(factory_name)
      expect(factory).to be_valid if factory.respond_to?(:valid?)
    end
  end
end
