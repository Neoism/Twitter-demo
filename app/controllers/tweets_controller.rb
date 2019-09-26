class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @tweet = Tweet.new
  end
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  def index
    if user_signed_in?
      user = current_user
      users = user.following
      @tweets = []
      users.each do |user|
        tweets = Tweet.where(user_id: user.id).order(created_at: :desc)
        @tweets.concat(tweets)
      end
      @tweets.sort_by!{|tweet| tweet.created_at}.reverse!
    else
      @tweets = Tweet.all.reverse_order
    end
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
