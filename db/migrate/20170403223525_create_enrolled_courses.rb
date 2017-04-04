class CreateEnrolledCourses < ActiveRecord::Migration
  def change
    create_table :enrolled_courses do |t|
      t.integer :course_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
