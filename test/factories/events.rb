FactoryGirl.define do
  factory :event do
    organization
    message "Hello World!"
    hostname "example.com"
    timestamp { Time.now }
  end
end
