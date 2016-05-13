describe 'the checkout' do

  context 'end to end feature testing' do
    describe 'basket one' do
      it 'should cost 66.78' do
        co = Checkout.new
        co.scan('001')
        co.scan('002')
        co.scan('003')
        expect(co.total).to equal(66.78)
      end
    end
  end
  
end
