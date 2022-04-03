class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :prevent_url, only: [:edit, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
     @item.destroy
     redirect_to root_path
  end

  private
def set_item
  @item = Item.find(params[:id])
end
  
def prevent_url
  if @item.user_id != current_user.id
    redirect_to action: :index 
  end
end

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id,
                                 :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end
end
