class MultibuyDiscount

  attr_reader :code, :quantity, :discount_price

  def initialize(code, quantity, discount_price)
    @code = code
    @quantity = quantity
    @discount_price = discount_price
  end

  def apply_discount(order)
    return calculate_discount(order) if order[@code] >= @quantity
    return 0
  end

  private

  def calculate_discount(order)
    order[@code] * @discount_price
  end

end
