class CreateHistoryPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :history_points do |t|
      t.text :description
      t.references :employee, null: false, foreign_key: true
      t.timestamps
    end
  end
end
