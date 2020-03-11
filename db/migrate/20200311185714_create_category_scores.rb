class CreateCategoryScores < ActiveRecord::Migration[6.0]
  def change
    create_table :category_scores do |t|
      t.belongs_to :category, null: false, foreign_key: true
      t.belongs_to :life_wheel, null: false, foreign_key: true
      t.integer :score
      t.string :comment

      t.timestamps
    end
  end
end
