class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :user_type, :string
    add_column :users, :reputation, :integer
  end
end
