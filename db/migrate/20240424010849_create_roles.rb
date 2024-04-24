class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles do |t|
      t.references :job_seeker, null: false, foreign_key: true, index: true
      t.boolean :status, default: false
      t.integer :rating
      t.references :role_type, null: false, foreign_key: true, index: true

      t.timestamps
    end

    add_index :roles, :status
    add_index :roles, :rating
  end
end
