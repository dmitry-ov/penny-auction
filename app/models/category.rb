class Category < ActiveRecord::Base
 require 'carrierwave/orm/activerecord'
 has_many :products
 mount_uploader :avatar, AvatarUploader

 has_one :pictures, as: :imageable

 has_ancestry


 validates :name, presence: true
end
