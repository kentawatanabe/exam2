  class PicturesController < ApplicationController
  before_action :set_picture, only:[:edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
   end

   def create
     @picture = Picture.new(pictures_params)
     @picture.user_id = current_user.id
     if @picture.save
       redirect_to pictures_path, notice: "投稿が完了しました！"
     else
       render :new
     end
   end

   def edit
   end

   def update
     if @picture.update(pictures_params)
       redirect_to pictures_path, notice: "投稿を更新しました！"
     else
       render :edit
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "投稿を削除しました！"
  end

  private

    def pictures_params
      params.require(:picture).permit(:content, :image, :image_cache, :remove_image)
    end

    def set_picture
      @picture = Picture.find(params[:id])
    end
end
