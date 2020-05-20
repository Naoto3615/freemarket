class ItemsController < ApplicationController
  before_action :set_item_image, except: [:index, :new, :create]
  def index
    @items = Item.limit(10).order('created_at DESC')
  end


  def show
    @item = Item.find(params[:id])
    # @items=Item.all.includes(:item_images).order('created_at DESC')
    # @url = request.url
  end

  def new
    @item = Item.new
    @item.item_images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    # @items = Item.find(params[:id])
    # @items.save
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :area_id, :category_id, :condition_id, :delivery_charge_id, :delivery_day_id, item_images_attributes: [:image, :_destroy, :id])
  end


  def set_item_image
    @item = Item.find(params[:id])
  end
end
