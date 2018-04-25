class AddIsPrivateToTable < ActiveRecord::Migration[5.1]
  def change
    add_column :tables, :is_private, :boolean
  end
end
