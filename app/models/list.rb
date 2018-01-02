class List < ActiveRecord::Base
<<<<<<< HEAD
  has_many :items
=======
  # http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html#method-i-has_many
  has_many :items # just adds methods to my model.
  validates :name, :presence => true
>>>>>>> lecture-5
end
