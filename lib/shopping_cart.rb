class ShoppingCart

  attr_reader :name,
              :capacity,
              :products
  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
  end

  def add_product(product)
    products << product
  end

  def total_number_of_products
    sum_of_products = 0
    products.each do |product|
      sum_of_products += product.quantity
    end
    sum_of_products
  end


end
