FactoryBot.define do
  factory :user do
    sequence(:email, 10) { |n| "test+user#{n}@jogging.com" }
    password { 'password' }
  end

  factory :runner, class: User do
    sequence(:email, 10) { |n| "runner#{n}@jogging.com" }
    password { 'password' }
  end

  factory :admin, class: User do
    sequence(:email, 10) {|n| "admin#{n}@jogging.com" }
    password { 'password' }
    role { :admin_role  }
  end
end
