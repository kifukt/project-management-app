class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards, id: false do |t|
      t.primary_key :card_id
      t.integer :list_id
      t.string :title
      t.string :description
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end
