FactoryBot.define do
  factory :user do
    name                  {'test'}
    email                 {'test@example'}
    password              {'ooooo0'}
    password_confirmation {password}
    lastname              {'苗字'}
    firstname             {'名前'}
    lastname_kana         {'ミョウジ'}
    firstname_kana        {'ナマエ'}
    birthday              {'1990/01/01'}
  end
end