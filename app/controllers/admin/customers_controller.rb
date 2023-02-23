class Admin::CustomersController < ApplicationController
  def index
    @customer = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def customer_params
  end

end
