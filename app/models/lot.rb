class Lot < ActiveRecord::Base
  belongs_to :product
  has_many :bets

  validates :product, presence: true

  validates :step_price, presence: true, numericality: {greater_than_or_equal_to: 0.01}
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }

  validates :begin_date, presence: true
  validates :expire_date, presence: true

  validate :begin_date_less_expire_date


  scope :started, -> { where("begin_date < now()") }
  scope :active, -> { where("begin_date < now() AND now() < expire_date") }
  scope :finished, -> { where("expire_date < now()") }
  scope :future, -> { where("begin_date > now() AND now() < expire_date") }


  def started?
    self.begin_date < Time.now.utc
  end

  def active?
    now = Time.now.utc
    self.begin_date < now  &&  now < self.expire_date
  end

  def finished?
    self.expire_date < Time.now.utc
  end

  def future?
    now = Time.now.utc
    self.begin_date > now  &&  now < self.expire_date
  end


  private

  def begin_date_less_expire_date
    unless :begin_date < :expire_date
      errors.add(:begin_date, "begin date must be less than expire_date")
    end
  end

end
