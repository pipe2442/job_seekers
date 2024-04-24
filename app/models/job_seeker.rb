class JobSeeker < ApplicationRecord
  has_many :roles, dependent: :destroy
  has_many :non_availability_dates, dependent: :destroy
  has_many :locations

  validate :validate_locations_count

  def available_on_dates?(dates)
    non_availability_dates.where(date: dates).empty?
  end

  def within_distance?(latitude, longitude, miles)
    locations.any? { |location| Geocoder::Calculations.distance_between([latitude, longitude], [location.latitude, location.longitude]) <= miles }
  end

  def self.find_qualified_candidates(role_type_id, latitude, longitude, distance, dates)
    cache_key = "job_seekers_#{role_type_id}_#{latitude}_#{longitude}_#{distance}_#{dates.sort.join('_')}"
    
    cached_data = $redis.get(cache_key)

    return JSON.parse(cached_data, symbolize_names: true) if cached_data.present?

    unavailable_ids = NonAvailabilityDate.where(date: dates).select(:job_seeker_id).distinct

    job_seekers = JobSeeker.joins(:roles, :locations)
                          .where.not(id: unavailable_ids)
                          .where(roles: { role_type_id: role_type_id, status: true })
                          .distinct
                          .select { |js| js.within_distance?(latitude, longitude, distance) }
                          .sort_by { |js| -js.roles.find { |role| role.role_type_id == role_type_id }.rating }
                          .first(1000)

    $redis.set(cache_key, job_seekers.to_json, ex: 1.hour.to_i)

    job_seekers
  end

  private

  def validate_locations_count
    return if locations.count < 1000
    errors.add(:locations, "can have a maximum of 1000 locations")
  end
end
