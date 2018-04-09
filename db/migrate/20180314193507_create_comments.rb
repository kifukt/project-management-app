class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments, id: false do |t|
      t.primary_key :comment_id
      t.integer :card_id
      t.string :content
      t.references :creator, index: true, foreign_key: { to_table: :users }
      t.datetime :created_at, null: false
    end
  end
end
