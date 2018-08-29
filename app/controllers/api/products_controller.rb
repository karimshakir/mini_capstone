class Api::ProductsController < ApplicationController
  def all_products_action
    @products = Product.all
    render 'all_products_view.json.jbuilder'
  end

  def first_product_action
    @products = Product.first
    render 'first_product.json.jbuilder'
  end
end
