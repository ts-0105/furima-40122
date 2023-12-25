class OrdersController < ApplicationController
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @bought_address = BoughtAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @bought_address = BoughtAddress.new(bought_address_params)
    if @bought_address.valid?
      pay_item(@item)
      @bought_address.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end
  end


  private

  def bought_address_params
    params.require(:bought_address).permit(:post_num, :region_id, :city, :street, :building, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item(item)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: item.price  # 商品の値段
        card: bought_address_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end


end
