class Admin::Category < ActiveRecord::Base
  belongs_to :agency
  has_many :fields
end
