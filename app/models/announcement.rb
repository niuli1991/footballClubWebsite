class Announcement < ActiveRecord::Base
	validates :user_id, presence: true
	validates :annou_title, length: {in: 2..30}
	validates :content,  length: {minimum:5}
	validates :annou_type, inclusion: {in: %w(赛事公告 票务公告 引援公告)}
end
