class Checkout

  attr_reader :catalogue, :basket

  def initialize(catalogue)
    @catalogue = catalogue
    @basket = {}
  end

  def scan(code)
    @basket[code] ? @basket[code] += 1 : @basket[code] = 1
  end

  def total
    cost = 0
    @catalogue.each do |item|
      cost += item.price * @basket[item.code]
    end
    cost / 100.00
  end

end
