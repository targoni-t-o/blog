class LikesController < ApplicationController
  before_action :set_article

  def like
    @result = @resource.add_like!(current_user)
  end

  def unlike
    @result = @resource.remove_like!(current_user)
  end

  private

  def set_article
    @resource = if params[:article_id].present?
                  Article.find(params[:article_id])
                end
  end
end
