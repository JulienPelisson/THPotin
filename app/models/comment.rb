class Comment < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likeable
  belongs_to :commentable, polymorphic: true
  has_many :comment, as: :commentable
end
