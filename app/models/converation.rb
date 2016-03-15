class Converation < ActiveRecord::Base
  belongs_to :user
  has_many :messages, dependent: :destroy

  validates :friend_id, presence: true
  validates :user, presence: true, uniqueness: {scope: :friend_id}
  validate :not_same_people

  private
  def not_same_people
    if user_id == friend_id
      errors.add :friend_id, I18n.t("errors.converations.user_and_friend_were_same")
    end
  end
end
