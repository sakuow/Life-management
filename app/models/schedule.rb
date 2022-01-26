class Schedule < ApplicationRecord
  belongs_to :user
  validates :name, precense: true
  validates :start_time, presence: true
  validates :body, presence: true
end
