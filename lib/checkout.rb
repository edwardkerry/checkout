class Checkout

  attr_reader :basket

  def initialize(item_klass, promotional_rules)
    @catalogue = item_klass.catalogue
    @promotional_rules = promotional_rules
    @basket = Hash.new(0)
  end

  def scan(code)
    raise "Unknown item code" unless valid_item?(code)
    basket[code] += 1
  end

  def total
    ((price_of_order - discounts) / 100.00).round(2)
  end

  private

  attr_reader :promotional_rules, :catalogue

  def valid_item?(code)
    catalogue.map {|product| product.code }
      .include?(code)
  end

  def discounts
    promotional_rules.apply_discounts(price_of_order, basket)
  end

  def price_of_order
    basket.reduce(0) do |price, (item, amount)|
      catalogue_codes_with_prices[item] * amount
      price += catalogue_codes_with_prices[item] * amount
    end
  end

  def catalogue_codes_with_prices
    prices = catalogue.map do |item|
      [item.code, item.price]
    end
    prices.to_h
  end

end
