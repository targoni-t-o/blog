require 'active_support/concern'

module Articlable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!, except: :index
    before_action :set_article, only: %i[show edit update destroy]
    before_action :authorize_article, only: %i[edit update destroy]
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def authorize_article
    authorize(@article)
  end
end