class Answer < ActiveRecord::Base
  validates :body, presence: true
  acts_as_votable
  belongs_to :user
  belongs_to :question
end
