class LearnMoment < ActiveRecord::Base

	belongs_to :competency

	validates :title, :presence => true 

	validates :title, 	:presence => true

	mount_uploader :image, LearnMomentImageUploader

end
