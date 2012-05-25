class Admin::Field < ActiveRecord::Base
  belongs_to :category
  belongs_to :field_type
    
  default_scope :order => 'label asc'
  
  scope :by_agency, lambda { |agency_id| where(:agency_id => agency_id) }
  
end
