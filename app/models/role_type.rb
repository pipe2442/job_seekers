class RoleType < ApplicationRecord
  has_many :roles, dependent: :destroy
end