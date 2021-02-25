class Intercommunality < ApplicationRecord
  validates :name, :siren, presence: true
  validates :siren, uniqueness: { case_sensitive: false },
                    numericality: { only_integer: true },
                    length: { is: 9 }
   validates :form, inclusion: { in: %w(ca cu cc met) }
end
