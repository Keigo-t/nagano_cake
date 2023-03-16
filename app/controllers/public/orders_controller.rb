class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def index
  end

  def show
  end

  def confirm
    @cart_items = CartItem.all
    @order = Order.new(order_params)
    if params[:order][:address_number] == "1"
      # @order.name = current_customer.name

  end

  def complete
  end

  def create
  end

  private

  def order_params
    params.require(:order).permit(:payment_method)
  end

end
