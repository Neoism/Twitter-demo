class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
    @comments = @tweet.comments.reverse_order
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
