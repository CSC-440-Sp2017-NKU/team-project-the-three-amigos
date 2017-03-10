class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer_text
      t.string :date
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
