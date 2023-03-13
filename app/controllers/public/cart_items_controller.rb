class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
  end

  def update
    @cart
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    render :index
  end

  def destroy_all
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_item.save
    redirect_to items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
