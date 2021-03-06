class ShoppingCart

  attr_reader :name,
              :capacity,
              :products,
              :categories
  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
  end

  def add_product(product)
    products << product
  end

  def total_number_of_products
    products.sum do |product|
      product.quantity
    end
  end

  def is_full?
    total_number_of_products > capacity
  end

  def products_by_category(category)
    sorted_categories = products.find_all do |product|
       product.category == category
    end
    sorted_categories
  end

  def details
    {name: name, capacity: capacity}
  end 

  def percentage_occupied
    percentage_occupied = (total_number_of_products.to_f / capacity.to_f) * 100
    percentage_occupied.round(2)
  end

  def sorted_products_by_quantity
    sorted_quantity = products.sort_by do |product|
      product.quantity
    end.reverse
    sorted_quantity
  end

  def product_breakdown
    product_breakdown = products.group_by do |product|
      product.category
    end
    product_breakdown
  end
end
