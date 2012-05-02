class CommentsController < ApplicationController
  def create
    article_id = params[:comment].delete :article_id
    # Now would be a good time to verify the articles exists and this user has
    # any necessary permissions, etc. needed to attach to it, or know it exists

    @comment = Comment.new params[:comment]
    @comment.article_id = article_id

    @comment.save

    flash[:message] = "Comment Created!"

    redirect_to article_path @comment.article
  end
end
