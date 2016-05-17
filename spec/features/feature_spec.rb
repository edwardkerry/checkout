describe 'Feature test' do

  item1 = Item.new('001', 'Travel Card Holder', 925)
  item2 = Item.new('002', 'Personalised Cufflinks', 4500)
  item3 = Item.new('003', 'Kids T-shirt', 1995)
  catalogue = Item

  promo_rule = PromotionalRule.new(PercentageDiscount, MultibuyDiscount)
  promo_rule.set_percentage_discount(6000, 10)
  promo_rule.set_multibuy_discount('001', 2, 75)

  describe 'basket one' do
    it 'receives a discount for spending over £60' do
      co = Checkout.new(catalogue, promo_rule)
      co.scan('001')
      co.scan('002')
      co.scan('003')
      expect(co.total).to eq("£66.78")
    end
  end

  describe 'basket two' do
    it 'receives a discount for purchasing two travel card holders' do
      co = Checkout.new(catalogue, promo_rule)
      co.scan('001')
      co.scan('003')
      co.scan('001')
      expect(co.total).to eq("£36.95")
    end
  end

  describe 'basket three' do
    it 'receives both discounts' do
      co = Checkout.new(catalogue, promo_rule)
      co.scan('001')
      co.scan('002')
      co.scan('001')
      co.scan('003')
      expect(co.total).to eq("£73.76")
    end
  end

end
