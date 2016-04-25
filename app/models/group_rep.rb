class GroupRep < ActiveRecord::Base
  belongs_to :group_id
  has_many :events, foreign_key: :group_rep_id
  validates_format_of :email, :with => /@/

  has_secure_password

end
