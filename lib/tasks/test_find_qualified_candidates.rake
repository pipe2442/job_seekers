namespace :test do
  desc "Test the find_qualified_candidates method"
  task find_qualified_candidates: :environment do
    job_role_type_id = 23
    job_latitude = 40.7128
    job_longitude = -74.0060
    job_dates = [Date.parse('2024-03-14'), Date.parse('2024-03-24'), Date.parse('2024-03-25')]
    job_distance = 30

    job_seekers = JobSeeker.find_qualified_candidates(job_role_type_id, job_latitude, job_longitude, job_distance, job_dates)

    job_seekers.each do |js|
      puts "Job Seeker ID: #{js[:id]}, Rating: #{JobSeeker.find(js[:id]).roles.find_by(role_type_id: job_role_type_id).rating}"
    end
  end
end