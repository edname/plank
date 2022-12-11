# frozen_string_literal: true

class CustomersController < ApplicationController
  before_action :set_customer!, only: %i[edit update destroy]

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def edit; end

  def create
    @customer = Customer.new customer_params
    if @customer.save
      flash[:success] = t(:customer_created)
      redirect_to customers_path
    else
      flash[:error] = t(:error)
      render :new
    end
  end

  def update
    if @customer.update customer_params
      flash[:success] = t(:customer_updated)
      redirect_to customers_path
    else
      flash[:error] = t(:error)
      render 'edit'
    end
  end

  def destroy
    @customer.destroy
    flash[:success] = t(:customer_deleted)
    redirect_to customers_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :lastname, :address, :user_id)
  end

  def set_customer!
    @customer = Customer.find params[:id]
  end
end
