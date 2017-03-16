module UsersHelper
    def courses
        if StudentCourse.find_by(user_id: @user.id).nil?
            @courses = []
        else
            @sc = Course.where(["id = (SELECT course_id FROM student_courses WHERE user_id = ?)", @user.id]) 
            @courses = Array.new
            @sc.each do |c|
                @courses.push(c)
            end
        end
    end
end
