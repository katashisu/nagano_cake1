class Public::ItemsController < ApplicationController

def index
  @items = Item.all.page(params[:page]).per(8) #kaminari記述
  @genres = Genre.all #部分テンプレートで使用
end

def show
  @item = Item.find(params[:id])
  @cart_item = CartItem.new
  @genres = Genre.all #部分テンプレートで使用
end

def genre_search
	@genre = Genre.find(params[:genre_id_search])
	@items = Item.where(genre_id: params[:genre_id_search]).page(params[:page]).per(8) #kaminari記述
	@genres = Genre.all #部分テンプレートで使用
	#genre_search.html.erbを読み込ませます
end

end
