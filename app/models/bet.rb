class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :lot

  validates :user, presence: true
  validates :lot, presence: true

  validate :user_have_bets

  after_create :update_lot_and_time

  def update_lot_and_time
    self.lot.increase_price
    self.lot.increase_time
  end

  private

  def user_have_bets
    errors.add(:user, "user not have bets") if self.user.present? && self.user.betscount.zero?
  end
end
