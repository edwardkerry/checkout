describe PromotionalRule do

  let(:ten_percent_discount) {double calaculate_discount: 742 }
  let(:travelcard_discount) {double calculate_discount: 150 }
  let(:percent_discount_klass) { double new: ten_percent_discount}
  let(:multibuy_discount_klass) { double new: travelcard_discount}
  let(:order) { {"001"=> 1, "002"=>1, '003'=>1} }

  let(:promorules) { described_class.new(percent_discount_klass, multibuy_discount_klass) }

  describe '#set_percentage_discount' do
    it 'sets a unique percent discount rule ' do
      promorules.set_percentage_discount('6000', '10')
      expect(promorules.percent_rule).to eq(ten_percent_discount)
    end
  end

  describe "#set_multibuy_discount" do
    it 'adds a new multibuy discount to the rules array' do
      promorules.set_multibuy_discount('001', '2', '850')
      expect(promorules.multibuy_rules).to eq([travelcard_discount])
    end
  end

  describe '#apply_discounts' do
    xit "calls each multibuy rule to calculate the discounts" do
      allow(promorules.percent_rule).to receive(:calculate_discount).and_return(742)
      expect(promorules.apply_discounts(7420, order)).to eq(6678)
    end
    xit "calls percent rules to calculate the discounts" do
      promorules.set_percentage_discount('6000', '10')
      expect(promorules.percent_rule).to receive(:calculate_discount)
      promorules.apply_discounts(5000, order)
    end
  end

end
