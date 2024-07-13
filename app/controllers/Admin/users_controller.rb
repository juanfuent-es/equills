
class Admin::UsersController < ApplicationController

  before_action :authenticate_admin!
  before_action :set_user, only: %i[ show edit update destroy ]

  layout "admin"

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update_profile
    current_user.update(profile_params)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_url, notice: "El usuario ha sido creado."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_url, notice: "El usuario ha sido actualizado."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @user == current_user
      redirect_to admin_users_url, notice: "No se puede eliminar tu usuario."
    else
      @user.destroy
      redirect_to admin_users_url, notice: "El usuario ha sido eliminado."
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :username, :password, :password_confirmation, :role, :bio, :www)
    end
    
    def profile_params
      params.require(:user).permit(:name, :email, :username, :bio, :www, :avatar)
    end
end
