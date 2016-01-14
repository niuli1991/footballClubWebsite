class Match < ActiveRecord::Base
	belongs_to :user
	validates :user_id, :kick_of_time, presence: true
	validates :host_team, :guest_team, length: {in 1..30}
	validates :match_type, inclusion: {in: %w(热身赛 友谊赛 中甲联赛 中超联赛 足协杯 超级杯 亚冠联赛)}
end
