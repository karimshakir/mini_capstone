class Api::ProductsController < ApplicationController
  def index
    @products = Product.all

    search_term = params[:search]
    if search_term
      @products = @products.where(
                                  "name iLike ?", "%#{search_term}%"
                                  )
    end

    sort_attribute = params[:sort]
    asc_or_desc = params[:asc_or_desc]

    if sort_attribute && asc_or_desc
      @products = @products.order(sort_attribute => asc_or_desc)
    elsif sort_attribute
      @products = @products.order(sort_attribute)
    end

    render 'index.json.jbuilder'
  end

  def create
    @product = Product.new(
                           name: params[:name],
                           price: params[:price],
                           text: params[:text],
                          )
    if @product.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end

  end

  def show
    @product = Product.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @product = Product.find(params[:id])

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.image_url = params[:image_url] || @product.image_url

    if @product.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json: {message: "Product successfully destroyed"}
  end
end




