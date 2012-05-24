class Admin::FieldType < ActiveRecord::Base
  attr_accessible :label
  belongs_to :agency  
  has_many :fields
end
