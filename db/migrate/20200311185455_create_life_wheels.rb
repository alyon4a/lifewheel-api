class CreateLifeWheels < ActiveRecord::Migration[6.0]
  def change
    create_table :life_wheels do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.date :date

      t.timestamps
    end
  end
end
