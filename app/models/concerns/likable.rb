require 'active_support/concern'

module Likable
  extend ActiveSupport::Concern

  included do
    has_and_belongs_to_many :liked_users, class_name: 'User'
  end

  def add_like(liker)
    liked_users << liker
  end

  def add_like!(liker)
    add_like(liker)
    save
  end

  def remove_like!(liker)
    liked_users.delete(liker)
  end

  def liked?(liker)
    liked_users.exists?(liker.id)
  end

  def likes_count
    liked_users.count
  end
end