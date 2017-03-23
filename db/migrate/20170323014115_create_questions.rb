class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :forum_id
      t.text :body
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :questions, :forum_id
  end
end
