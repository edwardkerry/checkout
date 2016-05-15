describe Item do

  let(:item1) { described_class.new('001', 'Travel Card Holder', '925')}

  describe 'defaults' do
    it 'should give each item a code' do
      expect(item1.code).to eq('001')
    end
    it 'should give each item a name' do
      expect(item1.name).to eq('Travel Card Holder')
    end
    it 'should give each item a price' do
      expect(item1.price).to eq(925)
    end
  end



end
