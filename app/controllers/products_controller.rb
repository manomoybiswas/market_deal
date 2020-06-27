class ProductsController < ApplicationController
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
    if @product.save
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
    params.require(:product).permit(:product_name, :product_description, :product_category_id, :product_unit, :price)
  end
end
