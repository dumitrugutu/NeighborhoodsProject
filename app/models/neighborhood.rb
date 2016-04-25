class Neighborhood < ActiveRecord::Base
  has_many :groups, foreign_key: :neighborhood_id

end
