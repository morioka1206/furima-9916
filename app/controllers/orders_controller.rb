class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_param, only: [:index, :create]
  before_action :sold_out  
  

  def index
    @customer_record = CustomerinfomationPurchaserecord.new
  end
  

  def create
    @customer_record = CustomerinfomationPurchaserecord.new(customer_params)
    if @customer_record.valid?
      pay_item
      @customer_record.save
      redirect_to root_path
      
    else
      render :index
    end
  end

  private
  def customer_params
    params.require(:customerinfomation_purchaserecord).permit(:postal_code, :state_id, :city, :address_line, :building_name, :phone_number, :purchase_record_id).merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])
  end

  def item_param
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: customer_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end


  def sold_out
    if @item.purchase_record.present? || @item.user_id == current_user.id
      redirect_to root_path
    end
  end

end