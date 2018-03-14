class Table < ApplicationRecord
  belongs_to :creator, polymorphic: true
  has_many :lists
end
