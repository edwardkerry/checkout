describe PromotionalRule do

  let(:ten_percent_discount) { double calaculate_discount: 0 }
  let(:travelcard_discount) { double calculate_discount: 0 }
  let(:percent_discount_klass) { double new: ten_percent_discount}
  let(:multibuy_discount_klass) { double new: travelcard_discount}
  let(:order) { {"001"=> 2, "002"=>1, '003'=>1} }

  let(:promorules) { described_class.new(percent_discount_klass, multibuy_discount_klass) }

    context 'before setting discounts' do
      describe '#set_percentage_discount' do
        it 'adds a unique percent discount rule ' do
          promorules.set_percentage_discount(6000, 10)
          expect(promorules.percent_rule).to eq(ten_percent_discount)
        end
      end

      describe "#set_multibuy_discount" do
        it 'adds a new multibuy discount to multibuy rules array' do
          promorules.set_multibuy_discount('001', 2, 850)
          expect(promorules.multibuy_rules).to eq([travelcard_discount])
        end
      end
    end

    context 'after setting discounts' do
      before do
        promorules.set_percentage_discount(6000, 10)
        promorules.set_multibuy_discount('001', 2, 850)
        promorules.set_multibuy_discount('002', 2, 900)
      end

     describe '#apply_discounts' do
      it "calls each multibuy rule to calculate the discounts" do
        allow(promorules.multibuy_rules.first).to receive(:calculate_discount).and_return(75)
        allow(promorules.multibuy_rules.last).to receive(:calculate_discount).and_return(75)
        allow(promorules.percent_rule).to receive(:calculate_discount).and_return(0)
        expect(promorules.apply_discounts(300, order)).to eq(150)
      end

      it "calls percent rules to calculate the discounts" do
        allow(promorules.percent_rule).to receive(:calculate_discount).and_return(600)
        expect(promorules.apply_discounts(6000, order)).to eq(600)
      end

      it 'calls both discount groups and totals the discount' do
        allow(promorules.multibuy_rules.first).to receive(:calculate_discount).and_return(75)
        allow(promorules.multibuy_rules.last).to receive(:calculate_discount).and_return(75)
        allow(promorules.percent_rule).to receive(:calculate_discount).and_return(600)
        expect(promorules.apply_discounts(6000, order)).to eq(750)
      end
    end
  end

end
