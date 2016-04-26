class Neighborhood < ActiveRecord::Base
  has_and_belongs_to_many :groups, foreign_key: :neighborhood_id
end
