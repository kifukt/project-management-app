class Task < ApplicationRecord
  belongs_to :user
  belongs_to :tasks_list
end
