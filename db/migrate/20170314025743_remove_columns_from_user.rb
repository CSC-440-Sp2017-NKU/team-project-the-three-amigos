class RemoveColumnsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :type, :string
    remove_column :users, :reputation, :string
  end
end
