class Admin::Field < ActiveRecord::Base
  belongs_to :category
  
  scope :by_agency, lambda { |agency_id| where(:agency_id => agency_id) }
  
end
