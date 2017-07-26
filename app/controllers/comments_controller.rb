class CommentsController < ApplicationController
  before_action :set_article, only: [:create, :destroy]

  def create
    @comment = @article.comments.build(comment_params)
    authorize(@comment)
    @comment.user = current_user
    @comment.save
    #TODO
    redirect_to article_path(@article)
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    authorize(@comment)
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end