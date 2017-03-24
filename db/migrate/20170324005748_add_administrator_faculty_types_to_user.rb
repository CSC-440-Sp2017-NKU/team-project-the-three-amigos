class AddAdministratorFacultyTypesToUser < ActiveRecord::Migration
  def change
    add_column :users, :administrator, :boolean, default: false
    add_column :users, :faculty, :boolean, default: false
  end
end
