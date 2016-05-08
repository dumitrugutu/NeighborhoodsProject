require 'date'

FactoryGirl.define do
  factory :event do |f|
    f.group_rep_id 1
    f.name 'Yolanda Squatpump'
    f.organizer_contact_info 'string to get in touch'
    f.event_time DateTime.new(2016, 6, 17, 10)
    f.is_free true
    f.location 'Chicago Lawn'
  end
end