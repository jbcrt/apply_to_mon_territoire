class Street < ApplicationRecord
  has_many :commune_streets
  has_many :communes, through: :commune_streets

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
