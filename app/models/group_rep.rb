class GroupRep < ApplicationRecord
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable and :omniauthable
devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  belongs_to :group
  has_many :events, foreign_key: :group_rep_id

  validates_presence_of :name, :email, :encrypted_password, :group_id
  validates_format_of :email, with: /\A[a-z0-9._%+-]+@[a-z0-9._]+\.[a-z]{2,4}\Z/i

end
