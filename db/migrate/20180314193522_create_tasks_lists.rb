class CreateTasksLists < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks_lists, id: false do |t|
      t.primary_key :tasks_list_id
      t.string :name
      t.integer :created_by
      t.datetime :created_at, null: false
    end
  end
end
