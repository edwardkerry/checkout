class Checkout

  attr_reader :prices, :basket

  def initialize
    @prices = { '001' => 9.25,
                '002' => 45.00,
                '003' => 19.95
              }
    @basket = []
  end

  def scan(item)
    @basket << item
  end

  def total
    cost = 0
    @basket.each do |item|
      cost += @prices[item]
    end
    cost
  end

end
