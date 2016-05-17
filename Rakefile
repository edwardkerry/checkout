require_relative 'lib/item'
require_relative 'lib/promotional_rule'
require_relative 'lib/discounts/percentage_discount'
require_relative 'lib/discounts/multibuy_discount'
require_relative 'lib/checkout'

require 'pry'

namespace :noths do
  desc 'Load example checkout system'
    task :load_checkout do
      item1 = Item.new('001', 'Travel Card Holder', 925)
      item2 = Item.new('002', 'Personalised Cufflinks', 4500)
      item3 = Item.new('003', 'Kids T-shirt', 1995)
      catalogue = Item

      promo_rule = PromotionalRule.new(PercentageDiscount, MultibuyDiscount)
      promo_rule.set_percentage_discount(6000, 10)
      promo_rule.set_multibuy_discount('001', 2, 75)
      binding.pry
      co = Checkout.new(catalogue, promo_rule)
  end
end
