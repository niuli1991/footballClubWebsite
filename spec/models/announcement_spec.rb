require 'rails_helper'

RSpec.describe Announcement, type: :model do
  
  it "成功创建一篇新公告" do
  	expect(build(:announcement)).to be_valid
  end

  it "创建人id不能为空" do
  	announcement = build(:announcement, user_id: nil)
  	announcement.valid?
  	expect(announcement.errors[:user_id]).to include("can't be blank")
  end

  it "公告类型不能为空" do
  	announcement = build(:announcement, annou_type: nil)
  	announcement.valid?
  	expect(announcement.errors[:annou_type]).to include("can't be blank")
  end

  it "公告内容不能为空" do
  	announcement = build(:announcement, content: nil)
  	announcement.valid?
  	expect(announcement.errors[:content]).to include("can't be blank")
  end

  it "公告标题长度不能小于2"  do
  	announcement = build(:announcement, annou_title: "1")
  	announcement.valid?
  	expect(announcement.errors[:annou_title]).to eq ["is too short (minimum is 2 characters)"]
  end

  it "公告类型错误" do
  	announcement = build(:announcement, annou_type: "赛事")
  	announcement.valid?
  	expect(announcement.errors[:annou_type]).to include("is not included in the list")
  end
end
