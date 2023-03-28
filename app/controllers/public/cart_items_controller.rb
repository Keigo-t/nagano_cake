class Public::CartItemsController < ApplicationController


  def index
    @cart_items = current_customer.cart_items
    @sum = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(amount: params[:cart_item][:amount])
    redirect_to cart_items_path
  end

  def destroy
    @item = CartItem.find(params[:id])
    @item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @item = current_customer.cart_items
    @item.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_items = current_customer.cart_items
    if @cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = @cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.update(amount: (params[:cart_item][:amount]).to_i + cart_item.amount)
      redirect_to cart_items_path
    else
      @cart_item = current_customer.cart_items.new(cart_item_params)
      @cart_item.save
      redirect_to cart_items_path
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
