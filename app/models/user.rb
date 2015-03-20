class User < ActiveRecord::Base

	#require 'carrierwave/orm/activerecord'

	has_secure_password

	has_many :competencies
	
	#attr_accessible :avatar
	
	mount_uploader :avatar, AvatarUploader

	# validates
	EMAIL_REGEX = /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\Z/i
	
	validates :name, 	:presence => true, 
							:length => { :maximum => 50 }

	validates :username, 	:presence => true, 
							:length => { :within => 6..25 }, 
							:uniqueness => true
	
	validates :email, 		:presence => true, 
							:length => { :maximum => 50 },
							:format => { :with => EMAIL_REGEX },
							:confirmation => true

	validates :password, :presence => true,
							:length => { :within => 4..25 }

	# scopes
	scope :sorted, lambda { order("users.name DESC")}

end
