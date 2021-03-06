class PercentageDiscount

  attr_reader :upper_limit, :percent

  def initialize(upper_limit, percent)
    @upper_limit = upper_limit
    @percent = percent
  end

  def calculate_discount(total)
    return discount_value(total) if total > @upper_limit
    return 0
  end

  private

  def discount_value(total)
    total / 100.00 * @percent
  end

end
