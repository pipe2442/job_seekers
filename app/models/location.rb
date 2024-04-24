class Location < ApplicationRecord
  belongs_to :job_seeker

  validates :latitude, presence: true, numericality: true
  validates :longitude, presence: true, numericality: true
end
