class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    tweet = Tweet.find(params[:tweet_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.tweet_id = tweet.id
    if comment.save!
      redirect_to tweet_path(tweet)
    else
      redirect_to tweets_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :tweet_id)
  end
end
