class EnrolledCourse < ActiveRecord::Base
    validates :user_id, presence: true
    validates :course_id, presence: true
    belongs_to :course
    belongs_to :user
end
