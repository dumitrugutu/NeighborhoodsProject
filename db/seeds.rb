# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).



# The "neighborhoods" seen below are actually the 77 community areas of Chicago, as seen at http://www.cityofchicago.org/content/dam/city/depts/doit/general/GIS/Chicago_Maps/Community_Areas/Community_Areas_W_Numbers.pdf
# Lat and Lng values for every neighborhood is placeholder. It needs to be changed when we roll out into other neighborhoods. Chicago Lawn is only neighborhood with working lat and lng values. 
neighborhoods = Neighborhood.create([{ name: 'Rogers Park', lat: 42.01, lng: -87.66}, {name: 'West Ridge', lat: 42.00, lng: -87.69}, {name: 'Uptown', lat: 41.96, lng: -87.65}, {name: 'Lincoln Square', lat: 41.96, lng: -87.68}, { name: 'North Center', lat: 41.95, lng: -87.68}, { name: 'Lake View', lat: 41.94, lng: -87.65}, { name: 'Lincoln Park', lat: 41.92, lng: -87.65}, { name: 'Near North Side', lat: 41.90, lng: -87.63}, { name: 'Edison Park', lat: 42.00, lng: -87.81}, { name: 'Norwood Park', lat: 41.98, lng: -87.80}, { name: 'Jefferson Park', lat: 41.98, lng: -87.77}, { name: 'Forest Glen', lat: 41.97, lng: -87.75}, { name: 'North Park', lat: 41.98, lng: -87.72}, { name: 'Albany Park', lat: 41.96, lng: -87.71}, { name: 'Portage Park', lat: 41.95, lng: -87.76}, { name: 'Irving Park', lat: 41.95, lng: -87.72}, { name: 'Dunning', lat: 41.94, lng: -87.80}, { name: 'Montclare', lat: 41.92, lng: -87.79},{ name: 'Belmont Cragin', lat: 41.92, lng: -87.76}, { name: 'Hermosa', lat: 41.92, lng: -87.73}, { name: 'Avondale', lat: 41.94, lng: -87.70}, { name: 'Logan Square', lat: 41.92, lng: -87.70}, { name: 'Humboldt Park', lat: 41.90, lng: -87.70}, { name: 'West Town', lat: 41.89, lng: -87.67}, { name: 'Austin', lat: 41.89, lng: -87.76}, { name: 'West Garfield Park', lat: 41.88, lng: -87.73}, { name: 'East Garfield Park', lat: 41.88, lng: -87.70}, { name: 'Near West Side', lat: 41.88, lng: -87.66}, { name: 'North Lawndale', lat: 41.85, lng: -87.71}, { name: 'South Lawndale', lat: 41.83, lng: -87.71}, { name: 'Lower West Side', lat: 41.84, lng: -87.66}, { name: 'Loop', lat: 41.88, lng: -87.62}, { name: 'Near South Side', lat: 41.85, lng: -87.62}, { name: 'Armour Square', lat: 41.84, lng: -87.63}, { name: 'Douglas', lat: 41.83, lng: -87.61}, { name: 'Oakland', lat: 41.82, lng: -87.60}, { name: 'Fuller Park', lat: 41.80, lng: -87.63}, { name: 'Grand Boulevard', lat: 41.81, lng: -87.61}, { name: 'Kenwood', lat: 41.80, lng: -87.59}, { name: 'Washington Park', lat: 41.79, lng: -87.61}, { name: 'Hyde Park', lat: 41.79, lng: -87.59}, { name: 'Woodlawn', lat: 41.78, lng: -87.59}, { name: 'South Shore', lat: 41.76, lng: -87.57}, { name: 'Chatham', lat: 41.74, lng: -87.61}, { name: 'Avalon Park', lat: 41.74, lng: -87.59}, { name: 'South Chicago', lat: 41.73, lng: -87.55}, { name: 'Burnside', lat: 41.72, lng: -87.59}, { name: 'Calumet Heights', lat: 41.72, lng: -87.57}, { name: 'Roseland', lat: 41.71, lng: -87.62}, { name: 'Pullman', lat: 41.68, lng: -87.60}, { name: 'South Deering', lat: 41.68, lng: -87.56}, { name: 'East Side', lat: 41.70, lng: -87.53}, { name: 'West Pullman', lat: 41.67, lng: -87.63}, { name: 'Riverdale', lat: 41.66, lng: -87.60}, { name: 'Hegewisch', lat: 41.65, lng: -87.54}, { name: 'Garfield Ridge', lat: 41.79, lng: -87.77}, { name: 'Archer Heights', lat: 41.81, lng: -87.72}, { name: 'Brighton Park', lat: 41.81, lng: -87.69}, { name: 'McKinley Park', lat: 41.83, lng: -87.67}, { name: 'Bridgeport', lat: 41.83, lng: -87.64}, { name: 'New City', lat: 41.80, lng: -87.65}, { name: 'West Elsdon', lat: 41.79, lng: -87.72}, { name: 'Gage Park', lat: 41.79, lng: -87.69}, { name: 'Clearing', lat: 41.77, lng: -87.76}, { name: 'West Lawn', lat: 41.77, lng: -87.72}, { name: 'Chicago Lawn', lat: 41.77, lng: -87.70}, { name: 'West Englewood', lat: 41.77, lng: -87.66}, { name: 'Englewood', lat: 41.77, lng: -87.64}, { name: 'Greater Grand Crossing', lat: 41.76, lng: -87.59}, { name: 'Ashburn', lat: 41.74, lng: -87.70}, { name: 'Auburn Gresham', lat: 41.74, lng: -87.65}, { name: 'Beverly', lat: 41.71, lng: -87.67}, { name: 'Washington Heights', lat: 41.71, lng: -87.65}, { name: 'Mount Greenwood', lat: 41.69, lng: -87.71}, { name: 'Morgan Park', lat: 41.68, lng: -87.66}, { name: "O'Hare", lat: 41.97, lng: -87.83}, { name: 'Edgewater', lat: 41.98, lng: -87.66}])


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
