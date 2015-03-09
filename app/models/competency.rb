class Competency < ActiveRecord::Base

	belongs_to :user
	has_many :learn_moments
	has_many :learning_goals

	validates :title, :presence => true

	# validates :goal, :presence => true

	# scope :sorted, lambda { order("learn_moments.competency_id DESC, learn_moments.updated_at DESC")}

end
