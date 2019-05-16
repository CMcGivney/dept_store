class ItemsController < ApplicationController
  before_action :set_dept
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = @dept.items
  end

  def show
  end

  def new
    @item = @dept.items.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @item = @dept.item.new(item_params)
    if @item.save
      redircet_to [@dept, @item]
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redircet_to [@dept, @item]
    else
      render :edit
    end
  end
  
  def destroy
    @item.destroy
    redircet_to dept_items_path
  end

   private

  def set_dept
    @dept = Dept.find(params[:dept_id])
  end
  def set_sub
    @item = Item.find(params[:id])
  end
  def item_params
    params.require(:item).permit(:item, :price, :discription)

  end
end

