class Question < ActiveRecord::Base
  validates :body, presence: true
  belongs_to :user
  belongs_to :forum
  has_many :answers
  def self.search(search)
    where("LOWER(body) LIKE ?", "%#{search.downcase}%")
  end
end
