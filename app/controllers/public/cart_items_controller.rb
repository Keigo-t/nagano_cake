class Public::CartItemsController < ApplicationController

  def index
    @customer = current_customer
    @cart_items = CartItem.all
    @total_price = 0
  end

  def update
    @cart
  end

  def destroy
    @item = CartItem.find(params[:id])
    @item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @item = current_customer.cart_items
    @item.destroy_all(cart_item_params)
    redirect_to cart_items_path
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      cart_item.update(amount: @cart_item.amount + cart_item.amount)
      redirect_to cart_items_path
    else
      @cart_item.save
      redirect_to cart_items_path
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
