class Workout < ActiveRecord::Base
  validates :mood, :workout, :date, presence: true
  has_many :exercises, dependent: :destroy
end
