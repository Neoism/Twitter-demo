class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    tweet = Tweet.find(params[:tweet_id])
    favorite = Favorite.new(tweet_id: tweet.id)
    favorite.user_id = current_user.id
    favorite.save
    redirect_to tweet_path(tweet)
  end
  def destroy
    tweet = Tweet.find(params[:tweet_id])
    favorite = Favorite.find_by(tweet_id: tweet.id)
    favorite.user_id = current_user.id
    favorite.destroy
    redirect_to tweet_path(tweet)
  end
end
