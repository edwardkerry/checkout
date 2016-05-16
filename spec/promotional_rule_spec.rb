describe PromotionalRule do

  let(:ten_percent_discount) {double apply_discount: 10 }
  let(:travelcard_discount) {double apply_discount: 825 }
  let(:percent_discount_klass) { double new: ten_percent_discount}
  let(:multibuy_discount_klass) { double new: travelcard_discount}
  let(:promorules) { described_class.new(percent_discount_klass, multibuy_discount_klass) }


  describe 'defaults' do
    it 'initialises with an array to store the rules' do
      expect(promorules.rules).to eq([])
    end
  end

  describe '#set_percentage_discount' do
    it 'adds a new percent discount to the rules array' do
      promorules.set_percentage_discount('6000', '10')
      expect(promorules.rules).to eq([ten_percent_discount])
    end
  end

  describe "#set_multibuy_discount" do
    it 'adds a new percent discount to the rules array' do
      promorules.set_multibuy_discount('001', '2', '850')
      expect(promorules.rules).to eq([travelcard_discount])
    end
  end

end
