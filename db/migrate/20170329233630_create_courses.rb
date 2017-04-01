class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.datetime :time
      t.string :section
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
