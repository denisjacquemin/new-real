class Admin::Theme < ActiveRecord::Base
  attr_accessible :agency_id, :title
  
  # associations
  belongs_to :agency
  has_many :assets
  has_many :templates,   :class_name => 'Component', :conditions => "component_type_id = 1"
  has_many :pages,       :class_name => 'Component', :conditions => "component_type_id = 2"
  has_many :stylesheets, :class_name => 'Component', :conditions => "component_type_id = 3"
  has_many :javascripts, :class_name => 'Component', :conditions => "component_type_id = 4"  
  has_many :assets  

  
  # scopes
  scope :by_agency, lambda { |agency_id| where(:agency_id => agency_id) }
  
end
