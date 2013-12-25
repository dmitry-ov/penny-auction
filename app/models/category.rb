class Category < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'
  has_ancestry

 mount_uploader :avatar, AvatarUploader

 has_many :products
 
 validates :name, presence: true
end
