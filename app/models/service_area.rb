class ServiceArea < ActiveRecord::Base
  belongs_to :groups
  belongs_to :neighborhoods
end
