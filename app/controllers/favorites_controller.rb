class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    #flash[:success] = 'micropostをお気に入りに登録しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unlike(micropost)
    #flash[:success] = 'お気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
    #redirect_to root_path
  end
end
