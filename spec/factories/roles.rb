FactoryBot.define do
  factory :role do
  end

  factory :role_admin, class: Role do
    password { 'password' }
  end
end
