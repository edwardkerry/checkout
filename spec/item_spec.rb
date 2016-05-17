describe Item do

  before do
    load 'item.rb'
  end

  let(:item1) { described_class.new('001', 'Travel Card Holder', 925)}
  let(:item2) { described_class.new('002', 'Personalised cufflinks', 4500)}

  describe 'class variable @@catalogue' do
    it 'holds all Item instances as array of objects' do
      expect(Item.catalogue).to eq([item1, item2])
    end
  end

  describe 'defaults' do
    it 'set item code' do
      expect(item1.code).to eq('001')
    end

    it 'set item name' do
      expect(item1.name).to eq('Travel Card Holder')
    end

    it 'set item price' do
      expect(item2.price).to eq(4500)
    end
  end

end
