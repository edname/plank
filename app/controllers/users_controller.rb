# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user!, only: %i[edit update destroy]
  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: %i[edit update destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new user_params
    if @user.save
      sign_in @user
      flash[:success] = t(:user_created)
      redirect_to users_path
    else
      flash[:error] = t(:error)
      render :new
    end
  end

  def update
    if @user.update user_params
      flash[:success] = t(:user_updated)
      redirect_to users_path
    else
      flash[:error] = t(:error)
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t(:user_deleted)
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_comfirmation, :old_password, :new_password)
  end

  def set_user!
    @user = User.find params[:id]
  end
end
