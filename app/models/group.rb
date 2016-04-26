class Group < ActiveRecord::Base
  has_many :neighborhoods, foreign_key: :group_id
end
