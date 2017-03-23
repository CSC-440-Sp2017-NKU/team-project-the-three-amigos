class Question < ActiveRecord::Base
  validates :body, presence: true
  belongs_to :user
  belongs_to :forum
  has_many :answers
end
