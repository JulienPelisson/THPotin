class Potin < ApplicationRecord
  belongs_to :user
  has_many :comment, as: :commentable
  has_many :likes, as: :likeable
  has_many :join_table_potin_tags
  has_many :tags, through: :join_table_potin_tags

  validates :title, length: {minimum: 5}
  validates :content, length: {minimum: 5}
end
