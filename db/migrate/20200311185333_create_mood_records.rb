class CreateMoodRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :mood_records do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :mood
      t.date :date

      t.timestamps
    end
  end
end
