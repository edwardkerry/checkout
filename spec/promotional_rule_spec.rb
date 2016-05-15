# describe PromotionalRule do
#
#   let(:rule1) { described_class.new('test rule 1', (cost > 60.00 ? (cost / 10) : 0)) }
#
#   describe 'defaults' do
#     it 'sets a name on initialization' do
#       expect(rule1.name).to eq('test rule 1')
#     end
#     it 'sets a block of code to assess the discount' do
#       expect(rule1.discount).to eq(cost > 60.00 ? (cost / 10) : 0)
#     end
#   end
#
#
# end
