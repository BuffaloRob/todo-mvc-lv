class List < ActiveRecord::Base
<<<<<<< HEAD
  # http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html#method-i-has_many
  has_many :items # just adds methods to my model.
  validates :name, :presence => true
=======
  has_many :items
>>>>>>> origin
end
