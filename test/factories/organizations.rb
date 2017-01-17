FactoryGirl.define do
  sequence(:name) do |i|
    "MyOrg #{i}"
  end

  factory :organization do
    name
  end
end
