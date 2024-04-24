namespace :performance do
  desc "Benchmark the find_qualified_candidates method"
  task benchmark_candidates: :environment do
    require 'benchmark/ips'
    require 'redis'

    $redis.flushdb

    role_type_id = RoleType.find_by(name: 'Fullstack Developer').id
    job_latitude = 40.7128
    job_longitude = -74.0060
    job_dates = [Date.parse('2024-03-14'), Date.parse('2024-03-24'), Date.parse('2024-03-25')]
    job_distance = 30

    Benchmark.ips do |x|
      x.config(time: 5, warmup: 2)

      x.report("find_qualified_candidates") do
        JobSeeker.find_qualified_candidates(role_type_id, job_latitude, job_longitude, job_distance, job_dates)
      end

      x.compare!
    end
  end
end