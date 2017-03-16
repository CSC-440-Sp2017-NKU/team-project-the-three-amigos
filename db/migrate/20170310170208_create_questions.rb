class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question_text
      t.string :date
      t.integer :user_id
      t.string :forum

      t.timestamps null: false
    end
  end
end
