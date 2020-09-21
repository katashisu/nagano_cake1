class Owner::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new #新規登録時のフォームに渡す空モデル
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to owner_items_path
    else
      redirect_to new_owner_item_path
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
    else redirect_to edit_owner_item_path(@item) #空欄があればeditに戻す
    end

  end

private
def item_params
  params.require(:item).permit(:name, :introduction, :price, :is_active, :image, :genre_id)
end

end
