class Admin::ComponentType < ActiveRecord::Base
  attr_accessible :label
  
  has_many :components
end
