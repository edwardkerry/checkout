describe MultibuyDiscount do

    let(:discount) { described_class.new('001', 2, 850) }

    describe 'defaults' do
      it 'sets the item code' do
        expect(discount.code).to eq ('001')
      end
      it 'sets the item quantity' do
        expect(discount.quantity).to eq (2)
      end
      it 'sets the discounted price' do
        expect(discount.discount_price).to eq (850)
      end
    end
end
