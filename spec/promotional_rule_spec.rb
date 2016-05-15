describe PromotionalRule do

  describe 'defaults' do
    it 'sets a name on initialization' do
      rule1 = PromotionalRule.new('test rule 1')
      expect(rule1.name).to eq('test rule 1')
    end
  end
end
