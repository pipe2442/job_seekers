class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.references :job_seeker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
