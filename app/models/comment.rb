class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :converation

  validates :user, presence: true
  validates :content, presence: true, length: {maximum: Settings
                                               .comments.content_max_leng}

  scope :visible, ->{where state: "visible"}
end
