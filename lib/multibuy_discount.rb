class MultibuyDiscount

  attr_reader :code, :quantity, :discount_price

  def initialize(code, quantity, discount_price)
    @code = code
    @quantity = quantity
    @discount_price = discount_price
  end

  def calculate_discount(order)
    return discount_value(order) if order[@code] >= @quantity
    return 0
  end

  private

  def discount_value(order)
    order[@code] * @discount_price
  end

end
