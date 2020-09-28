class Owner::GenresController < ApplicationController

    before_action :authenticate_owner!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
       flash[:notice] = "ジャンルを追加しました"
       redirect_to owner_genres_path
    else
       @genres = Genre.all
       flash[:notice] = "ジャンルを追加できませんでした"
       render 'index'
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
       flash[:notice] = "更新が完了しました"
    redirect_to owner_genres_path
    else
    flash[:notice] = "更新に失敗しました"
    render 'edit'
    end
  end

  private
  def genre_params
  params.require(:genre).permit(:name, :is_active)
  end

end
