class CreateHabitRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :habit_records do |t|
      t.belongs_to :habit, null: false, foreign_key: true
      t.date :yes_date

      t.timestamps
    end
  end
end
