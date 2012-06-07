class Admin::Agency < ActiveRecord::Base
  has_many :items
  has_many :categories
  has_many :fields, :through => :categories
  has_many :field_types
  
  liquid_methods :items, :name
end
