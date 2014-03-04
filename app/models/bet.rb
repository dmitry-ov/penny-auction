class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :lot

  validates :user, presence: true
  validates :lot, presence: true
  validates :time, presence: true

  validate :user_have_bets

  private

  def user_have_bets
    errors.add(:user, "user not have bets") if self.user.betscount.zero?
  end
end
