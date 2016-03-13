require 'rails_helper'

RSpec.describe Match, type: :model do

  it "成功创建一场比赛赛程" do
  	expect(build(:match)).to be_valid
  end

  it "创建人id不能为空" do
  	match = build(:match, user_id: nil)
  	match.valid?
  	expect(match.errors[:user_id]).to include("can't be blank")
  end

  it "开赛时间不能为空" do
  	match = build(:match, kick_of_time: nil)
  	match.valid?
  	expect(match.errors[:kick_of_time]).to include("can't be blank")
  end

  it "比赛标题不能为空" do
  	match = build(:match, match_title: nil)
  	match.valid?
  	expect(match.errors[:match_title]).to include("can't be blank")
  end

  it "比赛类型错误" do
  	match = build(:match, match_type: "比赛")
  	match.valid?
  	expect(match.errors[:match_type]).to include("is not included in the list")
  end

  it "主队名称长度太短(2~30)" do
  	match = build(:match, host_team: "a")
  	match.valid?
  	expect(match.errors[:host_team]).to eq ["is too short (minimum is 2 characters)"]
  end

  it "客队名称长度太短(2~30)" do
  	match = build(:match, guest_team: "b")
  	match.valid?
  	expect(match.errors[:guest_team]).to eq ["is too short (minimum is 2 characters)"]
  end

  it "主队名称长度太长(2~30)" do
  	match = build(:match, host_team: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
  	match.valid?
  	expect(match.errors[:host_team]).to eq ["is too long (maximum is 30 characters)"]
  end

  it "客队名称长度太长(2~30)" do
  	match = build(:match, guest_team: "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb")
  	match.valid?
  	expect(match.errors[:guest_team]).to eq ["is too long (maximum is 30 characters)"]
  end  
end
