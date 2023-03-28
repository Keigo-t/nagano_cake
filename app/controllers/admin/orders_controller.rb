class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @sum = 0
  end

end
