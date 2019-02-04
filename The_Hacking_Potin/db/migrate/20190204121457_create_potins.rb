# frozen_string_literal: true

class CreatePotins < ActiveRecord::Migration[5.2]
  def change
    create_table :potins do |t|
      t.datetime :date
      t.string :title
      t.text :content
      t.belongs_to :user

      t.timestamps
    end
  end
end
