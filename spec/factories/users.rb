FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    password 'foobaraaa'
    password_confirmation 'foobaraaa'

    factory :admin do
    	admin true
    end
  end

end
