class Neighborhood < ApplicationRecord
  has_many :service_areas
  has_many :groups, through: :service_areas

  validates_presence_of :name
end
