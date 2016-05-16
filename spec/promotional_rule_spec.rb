describe PromotionalRule do

  let(:promorules) { described_class.new }

  describe 'defaults' do
    it 'initialises with a hash to store the rules' do
      expect(promorules.rules).to eq({})
    end
    # it 'sets a block of code to assess the discount' do
    #   expect(rule1.discount).to eq(cost > 60.00 ? (cost / 10) : 0)
    # end
  end


end
