class CommentsController < ApplicationController
  include Articlable

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to article_path(@article)
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end