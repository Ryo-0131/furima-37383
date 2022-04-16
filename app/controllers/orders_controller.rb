class OrdersController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_item, only: [:index, :create]
  before_action :prevent_url, only: [:index, :create]

  
  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  
  private

  def set_item
    @item = Item.find(params[:item_id])
  end
    
  def prevent_url
    if @item.user_id == current_user.id || @item.order.present?
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :ward, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end