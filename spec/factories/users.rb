FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { "MyString" }
    mobile { "MyString" }
    password_digest { "MyString" }
    admin { false }
    avater { "MyString" }
  end
end
