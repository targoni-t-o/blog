require 'active_support/concern'

module Articlable
  extend ActiveSupport::Concern

  included do
    before_action :set_article, only: [:show, :edit, :update, :destroy]
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end
end