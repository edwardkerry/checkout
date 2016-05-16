describe Checkout do

  let(:item1) { double code:'001', name: 'Travel Card Holder', price: 925 }
  let(:item2) { double code:'002', name: 'Personalised cufflinks', price: 4500 }
  let(:catalogue) { [item1, item2] }
  let(:co) { described_class.new(catalogue) }

  describe '#scan' do
    it 'adds scanned item to the basket' do
      co.scan('001')
      expect(co.basket).to eq({'001' => 1})
    end
    it 'adds multiple items to the basket' do
      co.scan('001')
      co.scan('002')
      co.scan('001')
      expect(co.basket).to eq({'001' => 2, '002' => 1})
    end
    it 'only accepts valid items' do
      expect{co.scan('bad_code')}.to raise_error('Unknown item code')
    end
  end

  describe '#total' do
    it 'returns the cost of a standard basket' do
      co.scan('001')
      co.scan('002')
      expect(co.total).to eq(54.25)
    end
  end

end
