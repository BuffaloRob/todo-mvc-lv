class User < ActiveRecord::Base
  validates :email, :presence => true
  validates :email, :uniqueness => {:message => "is already being used"} 

end
