class Click < ApplicationRecord
  validates :ip_address, presence: true
  validates :user_agent, presence: true
end
