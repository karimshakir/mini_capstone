class Api::ProductsController < ApplicationController
  def all_products_action
    @products = Products.all
    render 'all_products_view.json.jbuilder'
  end
end
