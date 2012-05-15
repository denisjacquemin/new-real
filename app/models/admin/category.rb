class Admin::Category < ActiveRecord::Base
  belongs_to :agency
  has_many :fields
  
  scope :by_agency, lambda { |agency_id| where(:agency_id => agency_id) }
  
end
