# Create Role Types
fullstack_developer = RoleType.create(id: 23, name: 'Fullstack Developer', description: 'Handles both backend and frontend')
other_role = RoleType.create(name: 'Other Role', description: 'Description here')

# Create Job Seekers and assign roles and other attributes
job_seeker_one = JobSeeker.create
Location.create(latitude: 40.7128, longitude: -74.0060, job_seeker_id: job_seeker_one.id)
Location.create(latitude: 40.730610, longitude: -73.935242, job_seeker_id: job_seeker_one.id)
NonAvailabilityDate.create(date: '2024-03-16', job_seeker_id: job_seeker_one.id)
Role.create(status: true, rating: 95, job_seeker_id: job_seeker_one.id, role_type: fullstack_developer)

job_seeker_two = JobSeeker.create
Location.create(latitude: 40.7580, longitude: -73.9855, job_seeker_id: job_seeker_two.id)
Location.create(latitude: 40.748817, longitude: -73.985428, job_seeker_id: job_seeker_two.id)
NonAvailabilityDate.create(date: '2024-03-19', job_seeker_id: job_seeker_two.id)
Role.create(status: true, rating: 45, job_seeker_id: job_seeker_two.id, role_type: fullstack_developer)

job_seeker_three = JobSeeker.create
Location.create(latitude: 40.730610, longitude: -73.935242, job_seeker_id: job_seeker_three.id)
Location.create(latitude: 40.7128, longitude: -74.0060, job_seeker_id: job_seeker_three.id)
NonAvailabilityDate.create(date: '2024-03-20', job_seeker_id: job_seeker_three.id)
Role.create(status: true, rating: 28, job_seeker_id: job_seeker_three.id, role_type: fullstack_developer)

# Create 2000 random job seekers
2000.times do |i|
  js = JobSeeker.create
  Location.create(latitude: 41 + rand(-180..35), longitude: -750 + rand(-1..12), job_seeker_id: js.id)
  NonAvailabilityDate.create(date: Date.parse('2024-03-15'), job_seeker_id: js.id)
  Role.create(job_seeker_id: js.id, status: [true, false].sample, rating: rand(20..40), role_type: other_role)
end
