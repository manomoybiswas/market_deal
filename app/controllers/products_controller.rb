class ProductsController < ApplicationController
  include ProductsHelper
  before_action :authenticate_user!, :check_user_is_admin
  before_action :set_product, only: [:edit, :update]
  def index
    @products= Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(products_param)
    @product.user_id = current_user.id
    if @product.save
      params[:product_picture]["picture"].each do |file|
        @product_picture = @product.product_picture.create(picture: file, product_id: @product.id)
      end if params[:product_picture].present?
      redirect_to products_path, flash: {success: "Product added"}
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(products_param)
      params[:product_picture]["picture"].each do |file|
        @product_picture = @product.product_picture.create(picture: file, product_id: @product.id)
      end if params[:product_picture].present?
      redirect_to products_path, flash: {success: "product updated"}
    else
      render "edit"
    end
  end


  private
  def set_product
    @product = Product.find(params[:id])
  end

  def products_param
    params.require(:product).permit(:title, :summary, :unit_id, :type, :content, product_picture_attributes: [:id, :product_id, :picture], available_quantity_attributes: [:id, :product_id, :unit_id, :packet_size, :discount_percent, :discount_amount, :retail_price])
  end
end
