class Workout < ApplicationRecord
    validates :title, presence: true, length: {minimum:6, maximum:20} 
    validates :duration, presence: true, length: {minimum:1, maximum:5}
    validates :calories, presence: true, length: {minimum:1, maximum:5}
    validates :note, length: {minimum:0, maximum:250}
end
