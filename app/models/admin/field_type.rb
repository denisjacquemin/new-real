class Admin::FieldType < ActiveRecord::Base
  attr_accessible :label
  belongs_to :agency  
end
