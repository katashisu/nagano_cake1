class Public::HomesController < ApplicationController
  def top
  	@genres = Genre.all #部分テンプレートで使用
  	
  	@recommended_items = [Item.find(2),Item.find(3),Item.find(5),Item.find(6)]
  end

  def about
  end
end
