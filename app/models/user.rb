class User < ActiveRecord::Base
  has_many :messages
  has_many :posts
  has_many :converations
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  validates :email, presence: true, uniqueness: true,
    length: {maximum: Settings.users.email_max_leng}
  validates :name, presence: true, uniqueness: true,
    length: {maximum: Settings.users.name_max_leng}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum gender: [:Male, :Female, :Other]
  enum role: [:super_admin, :admin, :publisher, :member]
end
