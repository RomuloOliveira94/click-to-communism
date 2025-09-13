class Click < ApplicationRecord
  after_create_commit { broadcast_replace_to :clicks, target: "clicks_counter", partial: "home/clicks_counter", locals: { clicks_count: Click.count } }

  validates :ip_address, presence: true
  validates :user_agent, presence: true
end
