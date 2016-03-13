class Match < ActiveRecord::Base
	belongs_to :user
	validates :user_id, :kick_of_time, :match_title, presence: true
	validates :host_team, :guest_team, length: {in: 2..30}
	validates :match_type, inclusion: {in: %w(热身赛 友谊赛 中甲联赛 中超联赛 足协杯 超级杯 亚冠联赛)}
	mount_uploader :host_image, PictureUploader
  	mount_uploader :guest_image, PictureUploader
end
