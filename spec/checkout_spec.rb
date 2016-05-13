describe Checkout do

  let(:co) { described_class.new }

  describe 'defaults' do
    it 'should initialize with a list of items' do
      expect(co.prices).to eq({001 => 9.25, 002 => 45.00, 003 => 19.95})
    end
  end

  describe '#scan' do
    it 'should add a scanned item number to the basket' do
      co.scan(001)
      expect(co.basket).to eq([001])
    end
  end

end
