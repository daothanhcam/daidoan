class Message < ActiveRecord::Base
  belongs_to :converation, foreign_key: :converation_id
  belongs_to :user

  validates :user, presence: true
  validates :content, presence: true
  validates :converation, presence: true
  validates_length_of :content, maximum: Settings.messages.max_length,
    too_long: I18n.t("errors.messages.content_too_long")
end
