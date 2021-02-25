class Street < ApplicationRecord
  validates :title, presence: true
  validates :from, :to, numericality: { only_integer: true },
                        allow_nil: true
  validate :to_cannot_be_inferior_than_from

  private

  def to_cannot_be_inferior_than_from
    if from && to
      errors.add(:to, "can't be inferior than 'from' value") if from > to
    end
  end
end
