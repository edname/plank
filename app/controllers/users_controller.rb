# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t(:user_welcome)
      redirect_to root_path
    else
      flash[:error] = t(:error)
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_comfirmation)
  end
end
