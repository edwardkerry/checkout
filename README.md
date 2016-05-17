# Checkout

A Ruby checkout system taking a catalogue of items and various promotional discounts.

The system was test-driven using Rspec. All classes are unit-tested and isolated using dependency injection, and the overall system is tested with integrated feature tests.

## Installation

- Clone this repository

  `$ git clone github.com/edwardkerry/checkout`

- Change into directory

  `$ cd checkout`

- Install dependencies

  `$ bundle install`

- Run tests with RSpec

  `$ rspec`

## Instructions

- Load the system (automated or manual)

###### Automated loading
- Load the system into PRY using the Rakefile

  `$ rake`

###### Manual loading

- Open a REPL such as IRB or PRY

  `$ irb` or `$ pry`

- Require the system files

  ```
  $ require_relative 'lib/item'
  $ require_relative 'lib/promotional_rule'
  $ require_relative 'lib/discounts/percentage_discount'
  $ require_relative 'lib/discounts/multibuy_discount'
  $ require_relative 'lib/checkout'
  ```
- Create the necessary class instances, e.g:
  ```
  $ Item.new('001', 'Travel Card Holder', 925)
  $ Item.new('002', 'Personalised Cufflinks', 4500)
  $ Item.new('003', 'Kids T-shirt', 1995)
  $ catalogue = Item

  $ promo_rule = PromotionalRule.new(PercentageDiscount, MultibuyDiscount)
  $ promo_rule.set_percentage_discount(6000, 10)
  $ promo_rule.set_multibuy_discount('001', 2, 75)
  ```

### Operating instructions

- Create an instance of the checkout

  `$ co = Checkout.new(catalogue, promo_rule)`

- Scan item codes '001', '002' and '003', e.g

    `$ co.scan('001')` => 1

    `$ co.scan('002')` => 1

    `$ co.scan('004')` => RuntimeError: Unknown item code

- When ready, calculate the total

  `$ co.total` => £54.25

## System Design

The system is made up of five classes
* `Item`
  - Item instances represent products to be sold in the marketplace.
  - New Items take a code, a name and a price.
  - In lieu of a database, items are currently stored in an array held as a class variable `catalogue`.


* `PromotionalRule`
  - PromotionalRule is responsible for creating new sales and calculating discounts.
  - PromotionalRule takes two classes as initialization arguments, and has methods to instantiate these classes into the system.
  - `PercentageDiscount` is responsible for checking if a figure is above a specified threshold, and returning a specified percentage to be deducted if so.
  - Only one PercentageDiscount instance can be active in the system.
  - `MultibuyDiscount` is responsible for checking an order to see if a particular item has a certain number of purchases, and returning an amount to be deducted if so.
  - Multiple MultibuyDiscount instances may be active in the system.
  - PromotionalRule will then combine all discount figures into a final figure.


* `Checkout`
 - Checkout is the public interface to the system.
 - Checkout is instantiated taking an instance of PromotionalRule and the Item class as arguments.
 - Checkout will store scanned items, and upon the `total` method being called, pass the total cost and current order to PromotionalRule for discounts to be calculated.        
