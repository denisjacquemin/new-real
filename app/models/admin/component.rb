class Admin::Component < ActiveRecord::Base
  attr_accessible :theme_id, :component_type_id, :content, :template_id, :title, :permalink
  
  # associations
  belongs_to :component_type
  belongs_to :template, :class_name => 'Component'
  belongs_to :theme
  
  # scopes
  scope :by_permalink, lambda { |permalink| where(:permalink => permalink) }
  scope :by_agency, lambda { |agency_id| where("admin_themes.agency_id" => agency_id).joins(:theme) }
  scope :template, where(:component_type_id => 1)
  scope :page, where(:component_type_id => 2)
  scope :stylesheet, where(:component_type_id => 3)
  scope :javascript, where(:component_type_id => 4)
  
  # liquid
  liquid_methods :title, :content, :permalink
end
