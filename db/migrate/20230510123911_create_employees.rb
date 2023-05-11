class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name, :null => false
      t.string :middle_name
      t.string :last_name, :null => false
      t.string :current_position
      t.date :birthdate, :null => false
      t.date :date_of_employing
      t.string :email, :null => false
      t.timestamps
    end
  end
end
