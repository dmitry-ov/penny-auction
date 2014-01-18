class Category < ActiveRecord::Base
 require 'carrierwave/orm/activerecord'
 has_many :products
 mount_uploader :avatar, AvatarUploader

 has_one :picture, as: :imageable
 accepts_nested_attributes_for :picture

 has_ancestry


 validates :name, presence: true
end
