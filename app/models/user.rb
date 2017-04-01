class User < ActiveRecord::Base
  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Association link between users and forums       
  has_many :forums
  has_many :answers
  has_many :courses
  
  def increase_reputation(count=1)
    update_attribute(:reputation, reputation + count)
  end
  
  def decrease_reputation(count=1)
    update_attribute(:reputation, reputation - count)
  end
end
