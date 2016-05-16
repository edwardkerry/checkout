describe PromotionalRule do

  let(:ten_percent_discount) {double apply_discount: 10 }
  let(:travelcard_discount) {double apply_discount: 150 }
  let(:percent_discount_klass) { double new: ten_percent_discount}
  let(:multibuy_discount_klass) { double new: travelcard_discount}
  let(:order) { {"001"=> 3, "002"=>2} }

  let(:promorules) { described_class.new(percent_discount_klass, multibuy_discount_klass) }

  describe '#set_percentage_discount' do
    it 'adds a new percent discount to the rules array' do
      promorules.set_percentage_discount('6000', '10')
      expect(promorules.percent_rule).to eq(ten_percent_discount)
    end
  end

  describe "#set_multibuy_discount" do
    it 'adds a new percent discount to the rules array' do
      promorules.set_multibuy_discount('001', '2', '850')
      expect(promorules.multibuy_rules).to eq([travelcard_discount])
    end
  end

  describe '#apply_discount' do
    it "calls each multibuy rule to calculate the discounts" do
      promorules.set_multibuy_discount('001', '2', '850')
      expect(promorules.multibuy_rules).to receive(:apply_discount)
      promorules.apply_discount(5000, order)
    end
    it "calls percent rules to calculate the discounts" do
      promorules.set_percentage_discount('6000', '10')
      expect(promorules.percent_rule).to receive(:apply_discount)
      promorules.apply_discount(5000, order)
    end
  end

end
