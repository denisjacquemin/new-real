class Admin::FieldType < ActiveRecord::Base
  attr_accessible :label
  belongs_to :agency  
  has_many :fields
  
  default_scope :order => 'label asc'
end
