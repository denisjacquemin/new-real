class Admin::Asset < ActiveRecord::Base
  mount_uploader :file, FileUploader
  
  belongs_to :theme
  
  #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
      {
        "name" => read_attribute(:file),
        "size" => file.size,
        "url" => file.url,
        "thumbnail_url" => file.thumb.url,
        "asset_id" => id
      }
    end
end