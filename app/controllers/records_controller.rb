class RecordsController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    if @item.user_id != current_user.id
      @record_address = RecordAddress.new
    else
      redirect_to root_path
    end
  end

  def create
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
      @record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def record_params
    params.require(:record_address).permit(:post_code, :area_id, :city, :address, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
