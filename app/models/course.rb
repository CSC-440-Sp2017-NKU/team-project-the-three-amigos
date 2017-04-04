class Course < ActiveRecord::Base
  require 'csv'
  belongs_to :user
  # Association link between course and users
  has_many :enrolled_courses
  has_many :users, :through => :enrolled_courses
  
  def self.import(file)
      CSV.foreach(file.path, headers:true) do |row|
          Course.create! row.to_hash
      end
  end
  
end
