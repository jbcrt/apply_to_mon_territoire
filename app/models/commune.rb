class Commune < ApplicationRecord
  belongs_to :intercommunality, optional: true
  has_many :commune_streets
  has_many :streets, through: :commune_streets

  validates :name, :code_insee, presence: true
  validates :code_insee, length: { is: 5 }

  def self.search(city)
    Commune.where("lower(name) LIKE ?", "%#{sanitize_sql_like(city.downcase)}%")
  end
end
