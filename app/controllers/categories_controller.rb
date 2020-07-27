class CategoriesController < ApplicationController
  before_action :authenticate_user!, :check_user_is_admin
  before_action :set_category, only: [:edit, :update, :destroy]

  def create
    @category = Category.new(category_params)
    return redirect_to request.referrer, flash: { success: t("categories.add_success") } if @category.save
    render "new", flash: { danger: t("categories.faild") }
  end
  
  def destroy
    return redirect_to request.referrer, flash: { success: t("category.destroy_success") } if @category.destroy
    # else
    flash[:danger]=I18n.t "category.faild"
    # end
  end
  
  def edit
  end
  
  def index
    @categories = Category.all
    @category = Category.new
  end

  def update
    return redirect_to categories_path, flash: { success: t("categories.update_success") } if @category.update(category_params)
    render "edit", flash: { danger: t("categories.faild") }
  end
  
  private

  def category_params
    params.require(:category).permit(:title, :category_description)
  end

  def set_category
    @category = Category.find(params[:id])
  end

end
