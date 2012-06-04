class Admin::Item < ActiveRecord::Base
  belongs_to :agency
  has_many :fields
  has_many :fieldvalues, :dependent => :destroy

  scope :by_agency, lambda { |agency_id| where(:agency_id => agency_id) }
  
  liquid_methods :title, :description
  
end
