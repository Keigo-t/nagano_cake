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
      @order.name = current_customer.name
      @order.address = current_customer.customer_address

    elsif params[:order][:address_number]  == "2"
      if Address.exists?(name: params[:order][:registered])
        @order.name = current_customer.name
        @order.address = current_customer.customer_address
      else
        render :new
      end

    elsif params[:order][:address_number] == "3"
      address_new = current_customer.addresses.new(address_params)

    end
  end

  def complete
  end

  def create
  end

  private

  def order_params
    params.require(:order).permit(:payment_method)
  end

  def address_params
    params.require(:order).permit(:name, :address)
  end

end
