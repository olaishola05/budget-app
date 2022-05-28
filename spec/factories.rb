FactoryBot.define do
    factory :user do
        name {'Test User'}
        email {'usertest@mail.com'}
        password {'12345678'}
    end
end