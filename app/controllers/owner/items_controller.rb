class Owner::ItemsController < ApplicationController

    before_action :authenticate_owner!

  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def new
    @item = Item.new #新規登録時のフォームに渡す空モデル
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to owner_item_path(@item.id)
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
    redirect_to owner_item_path(@item)
    else
      render :edit
    end

  end

private
def item_params
  params.require(:item).permit(:name, :introduction, :price, :is_active, :image, :genre_id)
end

end
