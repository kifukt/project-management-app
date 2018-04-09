class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards, id: false do |t|
      t.primary_key :card_id
      t.integer :list_id
      t.string :title
      t.string :description
      t.references :creator, index: true, foreign_key: { to_table: :users } 
      t.integer :updated_by
      t.timestamps
    end
  end
end
