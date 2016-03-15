class Banner < ActiveRecord::Base
  belongs_to :post

  validates :post, presence: true
  validates :actived, presence: true
end
