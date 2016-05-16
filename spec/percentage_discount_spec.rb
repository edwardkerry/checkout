describe PercentageDiscount do

  let(:discount) { described_class.new(6000, 10)}

  describe 'defaults' do
    it 'set an upper limit' do
      expect(discount.upper_limit).to eq(6000)
    end
    it 'set a discount percentage' do
      expect(discount.percent).to eq(10)
    end
  end

  describe "#apply_discount" do
    it 'reduces a number over the upper_limit by the percentage' do
      expect(discount.apply_discount(10000)).to eq(1000)
    end
    it 'does not reduce a number under the upper_limit' do
      expect(discount.apply_discount(6000)).to eq(0)
    end
  end

end
