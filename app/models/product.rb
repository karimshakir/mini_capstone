class Product < ApplicationRecord

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  belongs_to :supplier
  has_many :images
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :product_categories
  has_many :categories, through: :product_categories


  # def categories
  #   product_categories.map { |product_category| product_category.category }

  # end


  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  def is_discounted?
    price < 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end

# Name - presence, uniqueness
# Description - presence, 20 to 200 characters
# Image url - uniqueness
# Price - presence, number, positive value, greater than 0
