class User < ActiveRecord::Base
  has_many :messages
  has_many :posts
  has_many :converations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  validates :email, presence: true, uniqueness: true,
    length: {maximum: Settings.users.email_max_leng}
  validates :name, presence: true, uniqueness: true,
    length: {maximum: Settings.users.name_max_leng}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def role_enum
    ["super admin", "admin", "publisher", "member"]
  end
end
