class ServiceArea < ActiveRecord::Base
  belongs_to :group
  belongs_to :neighborhood
  
  validates_presence_of :group_id, :neighborhood_id
end
