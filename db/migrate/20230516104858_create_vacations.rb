class CreateVacations < ActiveRecord::Migration[7.0]
  def change
    create_table :vacations do |t|
      t.date :start_date
      t.date :end_date
      t.integer :duration
      t.references :employee, null: false, foreign_key: true
      t.references :contract, null: false, foreign_key: true
      t.timestamps
    end
  end
end
