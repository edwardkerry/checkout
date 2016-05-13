class Checkout

  attr_reader :prices

  def initialize
    @prices = { 001 => 9.25,
                002 => 45.00,
                003 => 19.95
              }
  end

end
