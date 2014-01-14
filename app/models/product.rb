class Product < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'
  mount_uploader :avatar, AvatarUploader

  belongs_to :category
  has_many :lots, dependent: :destroy

  validates :title, presence: true, uniqueness: true, length: { in: 4..120 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
