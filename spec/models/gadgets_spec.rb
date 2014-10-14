require 'rails_helper'

RSpec.describe Gadget, :type => :model do
  describe 'search using name or desc'
    it 'find by name' do
      Gadget.create(name: "sony xperia",description: "smartphone",user: @user)
      gadgets = Gadget.search('sony')
      expect(gadgets.count).to eq(1)
    end
  it 'find by desc' do
    Gadget.create(name: "sony xperia",description: "smartphone",user: @user)
    gadgets = Gadget.search('phone')
    expect(gadgets.count).to eq(1)
  end
end
