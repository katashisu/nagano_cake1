class Public::HomesController < ApplicationController
  def top
  	@genres = Genre.all #部分テンプレートで使用
  end

  def about
  end
end
