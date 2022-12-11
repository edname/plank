# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user!, only: %i[edit update destroy]

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
    params.require(:user).permit(:name, :email, :password, :password_comfirmation)
  end

  def set_user!
    @user = User.find params[:id]
  end
end
