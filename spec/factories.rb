FactoryGirl.define do
  factory :user do
    email "foo@owner1.com"
    password  "hola.123"
  end

  factory :survey do
    name "clothing"
  end

  factory :question do
    content "clothing that you prefer"
  end

  factory :answer do
    content "vintage"
  end

end