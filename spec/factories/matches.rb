FactoryGirl.define do
  factory :match do
  	user_id 1
  	match_title "中甲联赛"
    match_type "中甲联赛"
	host_team "梅州客家"
	guest_team "天津权健"
	kick_of_time Time.now
	place "五华县体育场"	
  end

end
