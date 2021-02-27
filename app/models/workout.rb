class Workout < ApplicationRecord
    belongs_to :user
    validates :title, presence: true
    validates :duration, presence: true 
    validates :calories, presence: true 
    validates :note, length: {minimum:0, maximum:250}
end
