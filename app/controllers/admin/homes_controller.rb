class Admin::HomesController < ApplicationController
  def top
    @order_details = OrderDetail.all
    @sum = 0
  end
end
