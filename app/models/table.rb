class Table < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      :name,
      [:name, :table_id]
    ]
  end

  def should_generate_new_friendly_id?
    name_changed?
  end

  belongs_to :creator, polymorphic: true
  has_many :lists
end
