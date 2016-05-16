describe Checkout do

  let(:item1) { double code:'001', name: 'Travel Card Holder', price: 925 }
  let(:item2) { double code:'002', name: 'Personalised cufflinks', price: 4500 }
  let(:catalogue) { [item1, item2] }
  let(:co) { described_class.new(catalogue) }

  describe '#scan' do
    it 'should add a scanned item number to the basket' do
      co.scan('001')
      expect(co.basket).to eq({'001' => 1})
    end
    it 'should add multiple items to the basket' do
      co.scan('001')
      co.scan('002')
      co.scan('001')
      expect(co.basket).to eq({'001' => 2, '002' => 1})
    end
    it 'should only accept items that are in the catalogue' do
      expect{co.scan('bad_code')}.to raise_error('Unknown item code')
    end
  end

  describe '#total' do
    it 'should calculate the cost of a standard basket' do
      co.scan('001')
      co.scan('002')
      expect(co.total).to eq(54.25)
    end
  end

end
