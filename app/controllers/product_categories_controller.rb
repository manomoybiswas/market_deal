class ProductCategoriesController < ApplicationController
  before_action :authenticate_user!, :check_user_is_admin
  before_action :set_category, only: [:edit, :update, :destroy]

  def create
    @product_category = ProductCategory.new(product_category_params)
    return redirect_to product_categories_path, flash: { success: t("categories.add_success") } if @product_category.save
    render "new", flash: { danger: t("categories.faild") }
  end
  
  def destroy
    return redirect_to product_categories_path, flash: { success: t("category.destroy_success") } if @product_category.destroy
    flash[:danger]=I18n.t "category.faild"
  end
  
  def edit
  end
  
  def index
    @product_categories = ProductCategory.all
  end

  def new
    @product_category = ProductCategory.new
  end

  def update
    return redirect_to product_categories_path, flash: { success: t("categories.update_success") } if @product_category.update(product_category_params)
    render "edit", flash: { danger: t("categories.faild") }
  end
  
  private

  def product_category_params
    params.require(:product_category).permit(:category_name, :category_description)
  end

  def set_category
    @product_category = ProductCategory.find(params[:id])
  end
end
