class Card < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: :creator_id
  belongs_to :list
  has_many :comments
  has_many :tasks_lists
end
