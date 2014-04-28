#encoding: utf-8
class Upload < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	validates_presence_of :image, :name, :address, :tel, :email

	#validates_uniqueness_of :fbID, :message => '每個 Facebook 帳號 限參加乙次抽獎活動'
	
end
