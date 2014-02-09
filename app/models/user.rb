class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :betscount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def decrease_betscount
    self.betscount += -1
    self.save!
  end

  def is_admin
    true if admin
  end
end
