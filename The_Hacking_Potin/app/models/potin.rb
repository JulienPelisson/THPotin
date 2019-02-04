class Potin < ApplicationRecord
  belongs_to :user
  has_many :comment, as: :commentable
  has_many :likes, as: :likeable
  has_many :join_table_potin_tags
  has_many :tags, through: :join_table_potin_tags


end
