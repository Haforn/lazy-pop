class LearningGoal < ActiveRecord::Base

	belongs_to :competency

	validates :goal, :presence => true

end
