class Tweet < ApplicationRecord
  validates :username, :body, presence: true
end
