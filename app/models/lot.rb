class Lot < ActiveRecord::Base
  belongs_to :product
  validates :product, presence: true

  validates :step_price, presence: true, numericality: {greater_than_or_equal_to: 0.01}

  validates :begin_date, presence: true
  validates :expire_date, presence: true

  validate :begin_date_less_expire_date


  #scope :started, -> { where ("begin_date < #{Time.now}")}
  #scope :red, -> { where(color: 'red') }

  scope :started, -> { Lot.all.select { |lot| lot.started? } }
  scope :active, -> { Lot.all.select { |lot| lot.active? } }
  scope :finished, -> { Lot.all.select { |lot| lot.finished? } }

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


  private

  def begin_date_less_expire_date
    unless :begin_date < :expire_date
      errors.add(:begin_date, "can't be more than expire_date")
    end
  end

end
