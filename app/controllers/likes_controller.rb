class LikesController < ApplicationController
  before_action :set_article

  def like
    render json: {
      success: @resource.add_like!(current_user),
      action: 'like',
      count: @resource.likes_count,
      like_path: like_article_likes_path(@resource),
      unlike_path: unlike_article_likes_path(@resource)
    }
  end

  def unlike
    render json: {
      success: @resource.remove_like!(current_user),
      action: 'unlike',
      count: @resource.likes_count,
      like_path: like_article_likes_path(@resource),
      unlike_path: unlike_article_likes_path(@resource)
    }
  end

  private

  def set_article
    @resource = if params[:article_id].present?
                  Article.find(params[:article_id])
                end
  end
end
