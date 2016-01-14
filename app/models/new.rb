class New < ActiveRecord::Base
	belongs_to :user
	validates :user_id, :new_content, presence: true
	validates :new_title, length: {in: 1..50}
	validates :new_type, inclusion: {in: %w(赛事新闻 转会新闻)}
end
