class OrdersController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create, :edit]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @bought_address = BoughtAddress.new
  end

  def create
    @bought_address = BoughtAddress.new(bought_address_params)
    if @bought_address.valid?
      pay_item(@item)
      @bought_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def bought_address_params
    params.require(:bought_address).permit(:post_num, :region_id, :city, :street, :building, :phone_num).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item(item)
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: item.price, # 商品の値段
      card: bought_address_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

  def move_to_index
    return unless @item.bought.present? || current_user.id == @item.user.id

    redirect_to controller: :items, action: :index
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
