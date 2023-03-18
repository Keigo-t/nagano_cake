class Public::AddressesController < ApplicationController

  def index
    @customer = current_customer
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = current_customer.addresses.new(address_params)
    @address.save
    redirect_to addresses_path
  end

  def edit
    @address = current_customer.addresses.find(params[:id])
  end

  def update
    @address = current_customer.addresses.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    @address = current_customer.addresses.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end
