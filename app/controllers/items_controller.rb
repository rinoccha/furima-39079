class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Items.new
  end

  def create
    @item = Items.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:goods_name, :goods_explanation, :category_id, :condition_id, :charge_id, :area_id,
       :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
