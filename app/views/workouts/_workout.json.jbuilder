json.extract! workout, :id, :user, :title, :duration, :calories, :note, :created_at, :updated_at
json.url workout_url(workout, format: :json)
