class Item

  attr_reader :code, :name, :price, :catalogue

  @@catalogue = []

  def initialize(code,name,price)
    @code = code
    @name = name
    @price = price
    @@catalogue << self
  end

  def self.catalogue
    @@catalogue
  end

end
