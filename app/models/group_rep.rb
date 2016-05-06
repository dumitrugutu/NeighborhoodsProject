class GroupRep < ActiveRecord::Base
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable and :omniauthable
devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  belongs_to :group
  has_many :events, foreign_key: :group_rep_id

  validates_presence_of :name, :email, :password_digest, :group_id
  validates_format_of :email, :with => /@/

end
