class Intercommunality < ApplicationRecord
  has_many :communes

  validates :name, :siren, presence: true
  validates :siren, uniqueness: { case_sensitive: false },
                    numericality: { only_integer: true },
                    length: { is: 9 }
  validates :form, inclusion: { in: %w(ca cu cc met) }

  def communes_hash
    self.communes.pluck(:code_insee, :name).to_h
  end
end
