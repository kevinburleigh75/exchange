# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :browsing_event do
    event_factory

    referer "MyReferer"
  end
end
