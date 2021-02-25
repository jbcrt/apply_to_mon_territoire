class Commune < ApplicationRecord
  belongs_to :intercommunality
  
  validates :name, :code_insee, presence: true
  validates :code_insee, length: { is: 5 }
end
