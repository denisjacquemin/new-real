class Admin::FieldValue < ActiveRecord::Base
  attr_accessible :field_id, :item_id, :value
  
  belongs_to :item
  belongs_to :field
  
  delegate :field_type_id, :label, :category, :to => :field
  
  scope :find_by_item_and_field_ids, lambda { |item_id, field_id| where(:item_id => item_id, :field_id => field_id).pluck(:value).first}
end
