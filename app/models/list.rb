class List < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: :creator_id
  belongs_to :table
  has_many :cards
end
