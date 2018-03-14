class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks, id: false do |t|
      t.primary_key :taks_id
      t.integer :task_list_id
      t.string :content
      t.boolean :is_finished, default: false
      t.integer :assinged_to
      t.integer :created_by
      t.datetime :created_at, null: false
    end
  end
end
