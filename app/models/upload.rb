class Upload < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	validates_presence_of :image, :name, :address, :tel, :email
	
end
