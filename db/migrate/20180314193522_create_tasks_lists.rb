class CreateTasksLists < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks_lists, id: false do |t|
      t.primary_key :tasks_list_id
      t.integer :card_id
      t.string :name
      t.references :creator, index: true, foreign_key: { to_table: :users }
      t.datetime :created_at, null: false
    end
  end
end
