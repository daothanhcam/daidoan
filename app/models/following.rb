class Following < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :user, presence: true
  validates :post, presence: true, uniqueness: {scope: :user}
end
