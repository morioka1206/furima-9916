class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index ,:show]
  before_action :move_to_index, except: [:index, :show, :new, :create]

  def index
    @items = Item.order(id: "DESC")
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :state_id, :shipping_cost_id, :shipping_day_id,
                                 :condition_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    @item =  Item.find(params[:id])
    if user_signed_in? && current_user.id == @item.user_id
    else
      redirect_to root_path
    end
  end
end
