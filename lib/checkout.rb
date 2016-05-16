class Checkout

  attr_reader :basket

  def initialize(item_klass, promo_rule)
    @catalogue = item_klass.catalogue
    @promo_rule = promo_rule
    @basket = Hash.new(0)
  end

  def scan(code)
    raise "Unknown item code" unless valid_item?(code)
    @basket[code] += 1
  end

  def total
    cost = 0
    @basket.each do |item, amount|
      @catalogue.each do |product|
        cost += product.price * amount if product.code == item
      end
    end
    discount = @promo_rule.apply_discount(cost)
    (cost - discount) / 100.00.round(2)
  end

  private

  def valid_item?(code)
    @catalogue.map {|product| product.code }
      .include?(code)
  end

end
