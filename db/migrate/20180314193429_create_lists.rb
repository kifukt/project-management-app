class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists, id: false do |t|
      t.primary_key :list_id
      t.integer :table_id
      t.integer :created_by
      t.string :name
      t.datetime :created_at, null: false
    end
  end
end
