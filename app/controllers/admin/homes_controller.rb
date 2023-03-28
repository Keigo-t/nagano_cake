class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
    @sum = 0
    # @order_detail = OrderDetail.all
  end
end
