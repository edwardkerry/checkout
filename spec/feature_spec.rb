describe 'Feature test' do

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
    describe 'basket two' do
      it 'should cost 36.95' do
        co = Checkout.new
        co.scan('001')
        co.scan('003')
        co.scan('001')
        expect(co.total).to equal(36.95)
      end
    end
    describe 'basket three' do
      it 'should cost 73.76' do
        co = Checkout.new
        co.scan('001')
        co.scan('002')
        co.scan('001')
        co.scan('003')
        expect(co.total).to equal(73.76)
      end
    end
  end

end
