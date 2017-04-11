class User < ActiveRecord::Base
  require 'csv'
  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  # Association link between users and forums       
  has_many :forums
  has_many :answers
  has_many :enrolled_courses
  has_many :courses, :through => :enrolled_courses
  
  def increase_reputation(count=1)
    update_attribute(:reputation, reputation + count)
  end
  
  def decrease_reputation(count=1)
    update_attribute(:reputation, reputation - count)
  end
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      User.create! row.to_hash
    end
  end
  
  def timeout_in
    return 1.days
  end
end
