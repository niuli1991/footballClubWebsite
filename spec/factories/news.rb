FactoryGirl.define do
  factory :news, :class => 'News' do
    user_id 1
    news_title {Faker::Address.city}
	news_content {Faker::Address.street_name}
	news_type "赛事新闻"
  end

end
