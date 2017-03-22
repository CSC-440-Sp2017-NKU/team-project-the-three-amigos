class Forum < ActiveRecord::Base
    # Association link between forums and users
    belongs_to :user
end
