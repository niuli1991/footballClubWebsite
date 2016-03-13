FactoryGirl.define do
  factory :announcement do
    user_id 1
    annou_title {Faker::Address.city}
    content {Faker::Address.street_name}
	annou_type "赛事公告"

	factory :invalid_annou_type do
		annou_type "公告"
	end

	factory :invalid_user_id do
		user_id nil
	end

	factory :content do
		content "梅西转会梅州客家"
	end
  end

end
