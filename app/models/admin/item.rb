class Admin::Item < ActiveRecord::Base
  belongs_to :agency
  has_many :field_values, :dependent => :destroy

  scope :by_agency, lambda { |agency_id| where(:agency_id => agency_id) }
  
  liquid_methods :title, :description
    
  def field_values_attributes=(attributes)
    puts attributes.inspect()
  end
end
