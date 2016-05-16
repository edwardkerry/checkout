describe Item do

  let(:item1) { described_class.new('001', 'Travel Card Holder', '925')}

  describe 'defaults' do
    it 'items have a code' do
      expect(item1.code).to eq('001')
    end
    it 'items have a name' do
      expect(item1.name).to eq('Travel Card Holder')
    end
    it 'items have a price, as integer' do
      expect(item1.price).to eq(925)
    end
  end



end
