class Announcement < ActiveRecord::Base
	belongs_to :user
	validates :user_id, :content, presence: true
	validates :annou_title, length: {in: 2..30}
	validates :annou_type, inclusion: {in: %w(赛事公告 票务公告 转会公告)}
end
