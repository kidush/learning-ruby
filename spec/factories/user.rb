FactoryGirl.define do
  factory :user do
    first_name 'Adam'
    last_name 'Sandler'
    cpf '56243734650'
    email 'user@example.com'
    address 'User address'
    password 'password'
    password_confirmation 'password'
  end
end
