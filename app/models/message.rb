class Message < ActiveRecord::Base
  belongs_to :converation
  belongs_to :user
end
