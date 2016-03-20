class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :title, presence: true, length: {maximum: Settings.posts
    .title_max_leng}
  validates :content, presence: true, length: {maximum: Settings.posts
    .content_max_leng}
  validates :post_type, presence: true

  accepts_nested_attributes_for :comments, allow_destroy: true

  def post_type_enum
    PostType.pluck(:name, :id).to_h
  end
end
