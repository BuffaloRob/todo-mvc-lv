class List < ActiveRecord::Base
  # http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html#method-i-has_many
  validates :name, :presence => true

  has_many :items # just adds methods to my model.
  has_many :shared_lists
  has_many :users, :through => :shared_lists

  accepts_nested_attributes_for :items 

  def self.permissions_for(*args)
    association = args[0]
    methods = args[1..-1]

    #associations => :shared_lists
    #methods => [:edit, :view]

    methods.each do |method_name|
      define_method "#{method_name}able_by?" do |user|
        assoc = self.send(association).find_by(:user => user)
        if !assoc
          return false
        else 
          assoc.send("#{method_name}able?") 
        end
      end 
    end
  end

  #Dynamic Definition
  permissions_for :shared_lists, :edit, :view

  def viewable_by?(user)
    shared_list = self. shared_lists.find_by(:user => user.id)
    if !shared_list
      return false
    else
      shared_list.viewable? 
    end
  end

  def editable_by?(user)
    shared_list = self. shared_lists.find_by(:user => user.id)
    if !shared_list
      return false
    else
      shared_list.viewable? 
    end   
  end

end
