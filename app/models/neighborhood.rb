class Neighborhood < ActiveRecord::Base
  has_many :groups, through: :service_areas
end
