class PromotionalRule

  attr_reader :percent_rule, :multibuy_rules

  def initialize(percent_discount_klass, multibuy_discount_klass)
    @percent_discount = percent_discount_klass
    @multibuy_discount = multibuy_discount_klass
    @percent_rule = nil
    @multibuy_rules = []
  end

  def set_percentage_discount(upper_limit, discount)
    @percent_rule = @percent_discount.new(upper_limit, discount)
  end

  def set_multibuy_discount(item_code, quantity, new_price)
    @multibuy_rules << @multibuy_discount.new(item_code, quantity, new_price)
  end

  def apply_discount(total, order)
    apply_percentage_discount(total - apply_multibuy_discount(order)) +
    apply_multibuy_discount(order)
  end

  private

  def apply_multibuy_discount(order)
    discount = 0
    @multibuy_rules.each do |rule|
      discount += rule.apply_discount(order)
    end
    discount
  end

  def apply_percentage_discount(total)
    @percent_rule ? @percent_rule.apply_discount(total) : total
  end

end
