class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments, id: false do |t|
      t.primary_key :comment_id
      t.string :content
      t.integer :created_by
      t.datetime :created_at, null: false
    end
  end
end
