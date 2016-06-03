# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).



# The "neighborhoods" seen below are actually the 77 community areas of Chicago, as seen at http://www.cityofchicago.org/content/dam/city/depts/doit/general/GIS/Chicago_Maps/Community_Areas/Community_Areas_W_Numbers.pdf
neighborhoods = Neighborhood.create([{ name: 'Rogers Park'}, {name: 'West Ridge'}, {name: 'Uptown'}, {name: 'Lincoln Square'}, { name: 'North Center'}, { name: 'Lake View'}, { name: 'Lincoln Park'}, { name: 'Near North Side'}, { name: 'Edison Park'}, { name: 'Norwood Park'}, { name: 'Jefferson Park'}, { name: 'Forest Glen'}, { name: 'North Park'}, { name: 'Albany Park'}, { name: 'Portage Park'}, { name: 'Irving Park'}, { name: 'Dunning'}, { name: 'Montclare'}, { name: 'Belmont Cragin'}, { name: 'Hermosa'}, { name: 'Avondale'}, { name: 'Logan Square'}, { name: 'Humboldt Park'}, { name: 'West Town'}, { name: 'Austin'}, { name: 'West Garfield Park'}, { name: 'East Garfield Park'}, { name: 'Near West Side'}, { name: 'North Lawndale'}, { name: 'South Lawndale'}, { name: 'Lower West Side'}, { name: 'Loop'}, { name: 'Near South Side'}, { name: 'Armour Square'}, { name: 'Douglas'}, { name: 'Oakland'}, { name: 'Fuller Park'}, { name: 'Grand Boulevard'}, { name: 'Kenwood'}, { name: 'Washington Park'}, { name: 'Hyde Park'}, { name: 'Woodlawn'}, { name: 'South Shore'}, { name: 'Chatham'}, { name: 'Avalon Park'}, { name: 'South Chicago'}, { name: 'Burnside'}, { name: 'Calumet Heights'}, { name: 'Roseland'}, { name: 'Pullman'}, { name: 'South Deering'}, { name: 'East Side'}, { name: 'West Pullman'}, { name: 'Riverdale'}, { name: 'Hegewisch'}, { name: 'Garfield Ridge'}, { name: 'Archer Heights'}, { name: 'Brighton Park'}, { name: 'McKinley Park'}, { name: 'Bridgeport'}, { name: 'New City'}, { name: 'West Elsdon'}, { name: 'Gage Park'}, { name: 'Clearing'}, { name: 'West Lawn'}, { name: 'Chicago Lawn'}, { name: 'West Englewood'}, { name: 'Englewood'}, { name: 'Greater Grand Crossing'}, { name: 'Ashburn'}, { name: 'Auburn Gresham'}, { name: 'Beverly'}, { name: 'Washington Heights'}, { name: 'Mount Greenwood'}, { name: 'Morgan Park'}, { name: "O'Hare"}, { name: 'Edgewater'},])


groups = Group.create([{name: 'Marquette Park', website: 'www.chicagoparkdistrict.com/parks/Marquette-Park', contact_info: '(312)747-6469', address: '6743 S. Kedzie Ave.'}, {name: 'Montgomery Playground Park', website: 'none', contact_info: 'none', address: '6600 S. Talman Ave.'}, {name: 'Oakley Park', website: 'none', contact_info: 'none', address: '66441 S. Oakley Ave.'}, {name: 'Chicago Police Department - 8th District Station', website: 'none', contact_info: '(312)747-8730', address: '3420 W. 63rd St.'}, {name: 'Chicago Fire Department', website: 'none', contact_info: '', address: '3637 W. 59th St.'}, {name: 'Tarkington Elementary School', website: 'www.tarkington.cps.k12.il.us', contact_info: '(773)535-4700', address: '3330 W. 71st St.'}, {name: 'Marquette Elementary School', website: 'www.marquette.cps.k12.il.us', contact_info: '(773) 535-9260', address: '6550 S. Richmond St.'}, {name: 'Eberhart Elementary School', website: 'www.eberhartelem.org', contact_info: '(773) 535-9190', address: '3400 W. 65th Pl.'}, {name: 'Catalyst Maria Charter School', website: 'www.catalystschools.org', contact_info: '(773) 925-8686', address: '6727 S. California Ave.'}, {name: 'Greater Southwest Development Corporation
', website: 'www.greatersouthwest.org', contact_info: '(773)436-1000', address: '2601 W. 63rd St.'}, {name: 'Southwest Organizing Project
', website: 'www.swopchicago.org', contact_info: '(773) 471-8208', address: '2558 W. 63rd St.'}])

m_service_areas = ServiceArea.create([{neighborhood_id: 3, group_id: 1}, {neighborhood_id: 3, group_id: 7}])



group_reps = groups.map do |group|
  GroupRep.create([{group_id: 1, admin: false, name: Faker::Name.name, email: Faker::Internet.email, password: "kaboom"}])
end

admins = 5.times do
  GroupRep.create([{group_id: 1, admin: true, name: Faker::Name.name, email: Faker::Internet.email, password: "kaboom"}])
  end

# Have not yet set up organizer_contact_info
#group_rep_id is a randomized number
# events = group_reps.map do |group_rep|
#   Event.create([{group_rep_id: rand(1..10), name: Faker::Commerce.department, organizer_contact_info: "TBA", event_time: Faker::Time.forward(28, :morning)}, is_free: true, location: Faker::Address.street_address])
# end


# Marquette Park event examples below

m_rep = GroupRep.create({group_id: 1, admin: false, name: "Joe M", email: "joe@yahoo.com", password: "kaboom"})

m_admin = GroupRep.create({group_id: 1, admin: true, name: "Bob A", email: "bob@yahoo.com", password: "kaboom"})

m_rep_event = Event.create([{group_rep_id: m_rep.id, name: "Test Marquette Rep Event", organizer_contact_info: m_rep.email, event_time: Faker::Time.forward(28, :morning), is_free: true, location: "6700 S. Kedzie Ave."}])
m_admin_event = Event.create([{group_rep_id: m_admin.id, name: "Test Marquette Admin Event", organizer_contact_info: m_admin.email, event_time: Faker::Time.forward(28, :morning), is_free: true, location: m_admin.group.address}])




# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
