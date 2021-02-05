class RemoveUserFromWorkouts < ActiveRecord::Migration[6.1]
  def change
    remove_column :workouts, :user, :string
  end
end
