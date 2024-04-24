class Role < ApplicationRecord
  belongs_to :job_seeker
  belongs_to :role_type

  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end