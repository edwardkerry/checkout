class PromotionalRule

  attr_reader :rules

  def initialize(percent_discount_klass, multibuy_discount_klass)
    @rules = []
    @percent_discount = percent_discount_klass
    @multibuy_discount = multibuy_discount_klass
  end

  def set_percentage_discount(upper_limit, discount)
    @rules << @percent_discount.new(upper_limit, discount)
  end

  def set_multibuy_discount(item_code, quantity, new_price)
    @rules << @multibuy_discount.new(item_code, quantity, new_price)
  end

  def apply_discount(num)
    discount = 0
    @rules.each do |rule|
      discount += rule.apply_discount(num)
    end
    discount
  end

end
