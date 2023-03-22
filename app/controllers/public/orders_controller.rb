class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def index
    @order_details = OrderDetail.all
  end

  def show
    @order_detail = current_customer.order_details.find(params[:id])
    @order_details = OrderDetail.all
    @sum = 0
  end

  def confirm
    @cart_items = CartItem.all
    @order = Order.new(order_params)
    @sum = 0
    @order.shipping_cost = 800
    if params[:order][:address_number] == "1"
      @order.name = current_customer.last_name + current_customer.first_name
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code

    elsif params[:order][:address_number]  == "2"
      if Address.exists?(id: params[:order][:address_id])
        @address = Address.find(params[:order][:address_id])
        @order.address = @address.address
        @order.postal_code = @address.postal_code
        @order.name = @address.name
      else
        render :new
      end

    elsif params[:order][:address_number] == "3"
      address_new = current_customer.addresses.new(address_params)
      if address_new.save
      else
        render :new
      end
    end
  end

  def create
    cart_items = current_customer.cart_items
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart_item|
        order_item = OrderDetail.new
        order_item.item_id = cart_item.item_id
        order_item.order_id = @order.id
        order_item.amount = cart_item.amount
        order_item.price = cart_item.item.price
        order_item.save
      end
        redirect_to orders_complete_path
        cart_items.destroy_all
    end
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :name, :address, :postal_code, :shipping_cost, :total_payment)
  end

  def address_params
    params.require(:order).permit(:name, :address, :postal_code)
  end

end
