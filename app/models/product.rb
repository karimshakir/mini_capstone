class Product < ApplicationRecord

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  # validates :description, length: { minimum: 20 }
  # validates :description, length: { maximum: 200 }
  validates :image_url, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  belongs_to :supplier
  has_many :images
  has_many :orders

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
