class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.string :user
      t.string :title
      t.string :duration
      t.string :calories
      t.string :note

      t.timestamps
    end
  end
end
