class Event < ApplicationRecord
	validates :event_type, presence: true
	validates :public, presence: true
	validates :repo_id, presence: true
	validates :actor_id, presence: true
end
