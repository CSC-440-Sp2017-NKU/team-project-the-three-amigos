class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :topic

      t.timestamps null: false
    end
  end
end
