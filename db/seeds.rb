# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).




neighborhoods = Neighborhood.create([{ name: 'Chicago Lawn'}, {name: 'Marquette Park'}, {name: 'Marquette Park'}, {name: 'Chicago Lawn'}])


groups = Group.create([{name: 'Marquette Park', website: 'www.chicagoparkdistrict.com/parks/Marquette-Park', contact_info: '(312)747-6469', address: '6743 S. Kedzie Ave.'}, {name: 'Montgomery Playground Park', website: 'none', contact_info: 'none', address: '6600 S. Talman Ave.'}, {name: 'Oakley Park Park', website: 'none', contact_info: 'none', address: '66441 S. Oakley Ave.'}, {name: 'Chicago Police Department - 8th District Station', website: 'none', contact_info: '(312)747-8730', address: '3420 W. 63rd St.'}, {name: 'Chicago Fire Department', website: 'none', contact_info: '', address: '3637 W. 59th St.'}, {name: 'Tarkington Elementary School', website: 'www.tarkington.cps.k12.il.us', contact_info: '(773)535-4700', address: '3330 W. 71st St.'}, {name: 'Marquette Elementary School', website: 'www.marquette.cps.k12.il.us', contact_info: '(773) 535-9260', address: '6550 S. Richmond St.'}, {name: 'Eberhart Elementary School', website: 'www.eberhartelem.org', contact_info: '(773) 535-9190', address: '3400 W. 65th Pl.'}, {name: 'Catalyst Maria Charter School', website: 'www.catalystschools.org', contact_info: '(773) 925-8686', address: '6727 S. California Ave.'}, {name: 'Greater Southwest Development Corporation
', website: 'www.greatersouthwest.org', contact_info: '(773)436-1000', address: '2601 W. 63rd St.'}, {name: 'Southwest Organizing Project
', website: 'www.swopchicago.org', contact_info: '(773) 471-8208', address: '2558 W. 63rd St.'}])

service_areas = groups.map do |group|
  ServiceArea.create([{neighborhood_id: 1, group_id: group.id}
    ])
end


# stopped below making seed file, need to make events

group_reps = groups.map do |group|
  GroupRep.create([{group_id: group.id, name: Faker::Name.name, email: Faker::Internet.email, password: "kaboom"}])
end

# Have not yet set up organizer_contact_info
#group_rep_id is a randomized number
events = group_reps.map do |group_rep|
  Event.create([{group_rep_id: rand(1..10), name: Faker::Commerce.department, organizer_contact_info: "TBA", event_time: Faker::Time.forward(28, :morning)}, is_free: true])
end





# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
