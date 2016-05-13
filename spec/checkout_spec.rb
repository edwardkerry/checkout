describe Checkout do

  let(:co) { described_class.new }

  describe '#defaults' do
    it'should initialize with a list of items' do
      expect(co.prices).to eq({001 => 9.25, 002 => 45.00, 003 => 19.95})
    end
  end
end
