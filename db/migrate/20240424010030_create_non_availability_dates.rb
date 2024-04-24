class CreateNonAvailabilityDates < ActiveRecord::Migration[7.1]
  def change
    create_table :non_availability_dates do |t|
      t.references :job_seeker, null: false, foreign_key: true, index: true
      t.date :date

      t.timestamps
    end

    add_index :non_availability_dates, :date
    add_index :non_availability_dates, [:job_seeker_id, :date]
  end
end
