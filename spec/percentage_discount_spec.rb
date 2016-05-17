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

  describe "#calculate_discount" do
    it 'returns discount percentage of sum over upper limit' do
      expect(discount.calculate_discount(10000)).to eq(1000)
    end

    it 'returns 0 if sum is under the upper_limit' do
      expect(discount.calculate_discount(6000)).to eq(0)
    end
  end

end
