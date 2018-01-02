class User < ActiveRecord::Base
  has_secure_password
  
  validates :email, :presence => true
  validates :email, :uniqueness => {:message => "is already being used"} 

end
