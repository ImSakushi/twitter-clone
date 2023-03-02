class Tweet < ApplicationRecord
  validates :username, :body, :name, presence: true
end
