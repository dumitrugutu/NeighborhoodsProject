class ServiceArea < ActiveRecord::Base
  belongs_to :group
  belongs_to :neighborhood
end
