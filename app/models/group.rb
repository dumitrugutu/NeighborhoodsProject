class Group < ActiveRecord::Base
  has_many :neighborhoods, through: :service_areas
  has_many :group_reps, foreign_key: :group_id
end
