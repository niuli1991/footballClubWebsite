require 'rails_helper'

RSpec.describe News, type: :model do
  
  it "成功创建一篇新闻" do
  	expect(build(:news)).to be_valid
  end

  it "创建者id不能为空" do
  	news = build(:news, user_id: nil)
  	news.valid?
  	expect(news.errors[:user_id]).to include("can't be blank")
  end

  it "新闻内容不能为空" do
  	news = build(:news, news_content: nil)
  	news.valid?
  	expect(news.errors[:news_content]).to include("can't be blank")
  end

  it "新闻类型错误" do
  	news = build(:news, news_type: "新闻")
  	news.valid?
  	expect(news.errors[:news_type]).to include("is not included in the list")
  end

  it "新闻标题长度太短(2~50)" do
  	news = build(:news, news_title: "a")
  	news.valid?
  	expect(news.errors[:news_title]).to eq ["is too short (minimum is 2 characters)"]
  end

  it "新闻标题长度太长(2~50)" do
  	news = build(:news, news_title: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
  	news.valid?
  	expect(news.errors[:news_title]).to eq ["is too long (maximum is 50 characters)"]
  end
end
