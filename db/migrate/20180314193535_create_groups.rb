class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups, id: false do |t|
      t.primary_key :group_id
      t.integer :leader_id
      t.string :name
      t.timestamps
    end
  end
end
