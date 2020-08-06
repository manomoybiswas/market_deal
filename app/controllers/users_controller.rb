class UsersController < ApplicationController
  include UsersHelper
  layout "dashboard", only: [:dashboard, :index,]
  before_action :authenticate_user!, except: [:new, :create, :email_validator, :username_validator, :mobile_validator]
  before_action :check_user_is_admin, only: [:destroy]
  before_action :set_user, only: [:edit, :update, :destroy]
  def create
    @user = User.new(user_params) 
    @user.auth_type = "username_password"
    return redirect_to users_path, flash: { success: "Registration Successful" } if @user.save
    render "new", flash: { danger: "Registration faild. Please try again" }
  end
  
  def dashboard

  end

  def destroy
    return unless admin?
    return redirect_to users_path, flash: {success: t("user.destroy_success")} if @user.destroy
    redirect_to users_path, flash: {success: t("user.failed")}
  end
  
  def edit
    redirect_to root_path if !admin? && @user.id != current_user.id
  end
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def show
  end

  def update
    if admin? && @user != current_user
      if @user.update(user_params)
        redirect_to users_path, flash: { success: t("user.update_success") }
      else
        render "edit", flash: { danger: t("user.failed")}
      end
    elsif @user == current_user
      @user.name = user_params[:name] if user_params[:name]
      @user.dob = user_params[:dob] if user_params[:dob]
      @user.phone = user_params[:phone] if user_params[:phone]
      @user.avater = user_params[:avater] if user_params[:avater].present?
      redirect_to user_path(@user), flash: { success: t("user.update_success") } if @user.save
    end
  end  
  
  def email_validator
    @user = User.find_by_email(params[:email])
    render json: {email_exists: @user.present?}
  end

  def username_validator
    @user = User.find_by_username(params[:username])
    render json: {username_exists: @user.present?}
  end
  
  def mobile_validator
    @user = User.find_by_mobile(params[:mobile])
    render json: {mobile_exists: @user.present?}
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :username, :mobile, :password, :password_confirmation, :avater)
  end
end
