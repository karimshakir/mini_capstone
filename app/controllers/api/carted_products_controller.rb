class Api::CartedProductsController < ApplicationController
  def create
    @carted_product = CartedProduct.new(product_id: params[:product_id],
                                        quantity: params[:quantity],
                                        status: "carted",
                                        user_id: current_user.id
                                        )
    if @carted_product.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @carted_product.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
