require 'active_support/concern'

module Likable
  extend ActiveSupport::Concern

  included do
    has_many :likes, dependent: :destroy
  end

  def add_like(liker)
    likes.build(user: liker)
  end

  def add_like!(liker)
    add_like(liker)
    save
  end

  def remove_like!(liker)
    likes.where(user: liker).destroy_all.present?
  end

  def likes_count
    likes.count
  end

  def liked?(liker)
    likes.exists?(user: liker)
  end
end