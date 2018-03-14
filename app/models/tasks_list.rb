class TasksList < ApplicationRecord
  belongs_to :user
  belongs_to :card
  has_many :tasks
end
