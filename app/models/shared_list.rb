class SharedList < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  permissable :view, :edit, :destroy
    
  PERMISSIONS = {
    :destroy => 0,
    :edit => 10,
    :view => 100
  }

  def self.permissable(*args)
    args.each do |action|
      define_method "#{action}able?" do
        self.permission <= PERMISSIONS[action]
      end
    end
  end

  # meta program of this above
  # def viewable?
  #   self.permission <= PERMISSIONS[:guest]
  # end
  
  # def editable?
  #   self.permission <= PERMISSIONS[:collaborator]
  # end

  # def destroyable?
  #   self.permission <= PERMISSIONS[:owner]
  # end

end
