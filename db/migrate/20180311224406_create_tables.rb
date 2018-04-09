class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :tables, id: false do |t|
      t.primary_key :table_id
      t.string :name
      t.references :creator, polymorphic: true, index: true
      t.datetime :created_at, null: false
      t.string :slug
    end
  end
end
