class MultibuyDiscount

  attr_reader :code, :quantity, :discount_price

  def initialize(code, quantity, discount_price)
    @code = code
    @quantity = quantity
    @discount_price = discount_price
  end

end
