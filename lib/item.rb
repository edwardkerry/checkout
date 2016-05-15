class Item

  attr_reader :code, :name, :price, :catalogue

  def initialize(code,name,price)
    @code = code
    @name = name
    @price = price.to_i
  end

end
