class Admin::OrdersController < ApplicationController

  def show
    @order_detail = OrderDetail.find(params[:id])
    @order_details = OrderDetail.all
  end

end
