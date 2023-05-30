class RecordsController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    if @item.record.present?
      redirect_to root_path
    elsif @item.user_id != current_user.id
      @record_address = RecordAddress.new
    else
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @record_address = RecordAddress.new(record_address_params)
    if @record_address.valid?
      pay_item
      @record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def record_address_params
    params.require(:record_address).permit(:post_code, :area_id, :city, :address, :building, :telephone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: record_address_params[:token],
      currency: 'jpy'
    )
  end
end
