class News < ActiveRecord::Base
	belongs_to :user
	validates :user_id, :news_content, presence: true
	validates :news_title, length: {in: 1..50}
	validates :news_type, inclusion: {in: %w(赛事新闻 转会新闻)}
end
