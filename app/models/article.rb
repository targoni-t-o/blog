class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :commentators, through: :comments, source: :user

  validates :title, presence: true, length: {minimum: 5}
end
