class Forum < ActiveRecord::Base
    validates :topic, presence: true
    # Association link between forums and users
    belongs_to :user
    # Association link between forums and questions
    has_many :questions
end
