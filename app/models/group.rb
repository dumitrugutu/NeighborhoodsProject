class Group < ApplicationRecord
  has_many :service_areas
  has_many :neighborhoods, through: :service_areas
  has_many :group_reps, foreign_key: :group_id

  validates_presence_of :name
end
