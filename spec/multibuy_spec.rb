describe MultibuyDiscount do

  let(:discount) { described_class.new('001', 2, 75) }
  let(:order1) { {'001'=>2, '002'=>1} }
  let(:order2) { {'001'=>1, '002'=>3} }

  describe 'defaults' do
    it 'sets the item code' do
      expect(discount.code).to eq ('001')
    end
    it 'sets the item quantity' do
      expect(discount.quantity).to eq(2)
    end
    it 'sets the discounted price' do
      expect(discount.discount_price).to eq(75)
    end
  end

  describe '#calculate_discount' do
    it 'calculates a discount on multi-buy items' do
      expect(discount.calculate_discount(order1)).to eq(150)
    end
    it 'does not offer discounts on invalid items' do
      expect(discount.calculate_discount(order2)).to eq(0)
    end
  end

end
