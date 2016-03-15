class Feedback < ActiveRecord::Base
  belongs_to :user, foreign_key: :user_id

  validates :user, presence: true
  validates :title, presence: true, length: {maximum: Settings
                                             .feedbacks.title_max_leng}
  validates :content, length: {maximum: Settings.feedbacks
                                               .content_max_leng}
end
