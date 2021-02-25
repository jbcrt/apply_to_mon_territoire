class Commune < ApplicationRecord
  validates :name, :code_insee, presence: true
  validates :code_insee, length: { is: 5 }
end
