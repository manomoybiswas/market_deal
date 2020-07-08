class QuantitiesController < ApplicationController
  before_action :authenticate_user!, :check_user_is_admin
  before_action :set_quantity, only: [:edit, :update, :destroy]
  def create
    @quantity = Quantity.new(quantity_params)
    return redirect_to request.referrer, flash: { success: "Quantity added." } if @quantity.save
    render "new", flash: { danger: "Invalid data."}
  end

  def destroy
    return redirect_to request.referrer, flash: { succcess: "Quantity deleted." } if Quantity.destroy
    flash[:succcess] = "Something went wrong during deleting quantity."
  end

  def index
    @quantity = Quantity.new
    @quantities = Quantity.all
  end

  def new
    @quantity = Quantity.new
  end

  def update
    return redirect_to quantity_index_path, flash: { success: "Quantity updated" } if @quantity.update(quantity_params)
    render "edit", flash: { danger: "Something went wrong during updating quantity"}
  end

  private

  def quantity_params
    params.require(:quantity).permit(:product_id, :quantity_size, :unit)
  end

  def set_quantity
    @quantity = Quantity.find(params[:id])
  end
end
