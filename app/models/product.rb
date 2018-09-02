class Product < ApplicationRecord
  def is_discounted?
    price < 2
  end

  def tax
    price * 0.9
  end

  def total
    price + tax
  end

end
