class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups, id: false do |t|
      t.primary_key :group_id
      t.references :leader, index: true, foreign_key: { to_table: :users }
      t.references :creator, index: true, foreign_key: { to_table: :users }
      t.string :name
      t.timestamps
    end
  end
end
