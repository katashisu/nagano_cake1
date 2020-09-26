class Public::ItemsController < ApplicationController

def index
  # @items = Item.all
  @items_search = Item.select { |data| data.is_active == true and data.genre.is_active == true }#Itemの中から販売中and有効のみ格納
  @items_search = Kaminari.paginate_array(@items_search).page(params[:page]).per(8) #kaminari記述
  @genres = Genre.all #部分テンプレートで使用
end

def show
  @item = Item.find(params[:id])
  if @item.is_active == false || @item.genre.is_active == false #@itemの中から売り切れor無効の時
  	redirect_to public_items_path
  end

  @cart_item = CartItem.new
  @genres = Genre.all #部分テンプレートで使用

end

def genre_search
	@genre = Genre.find(params[:genre_id_search])
	@items = Item.where(genre_id: params[:genre_id_search], is_active: true).page(params[:page]).per(8) #kaminari記述
	@genres = Genre.all #部分テンプレートで使用
end

end
