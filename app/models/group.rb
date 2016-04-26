class Group < ActiveRecord::Base
  has_and_belongs_to_many :neighborhoods, foreign_key: :group_id
  has_many :group_reps, foreign_key: :group_id
end
