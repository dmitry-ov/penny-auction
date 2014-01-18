class Picture < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'
  mount_uploader :avatar, AvatarUploader

  belongs_to :imageable, polymorphic: true
end
