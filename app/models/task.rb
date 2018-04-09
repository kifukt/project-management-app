class Task < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: :creator_id
  belongs_to :tasks_list
end
