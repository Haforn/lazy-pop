class CompetenciesController < ApplicationController

	layout 'application'

	before_action :title_select_options_array, :expertise_select_options_array
	before_action :set_competency, except: [:index, :new, :create]

	def index
		@competencies = current_user.competencies

		@hours_spend = ['0.30', '1', 
                    '1.30', '2', 
                    '2.30', '3', 
                    '3.30', '4',
                    '4.30', '5', 
                    '5.30', '6', 
                    '6.30', '7', 
                    '7.30', '8']		
	end

	def show 
		@learning_goals = LearningGoal.where(:competency_id => @competency.id).order("learning_goals.updated_at DESC") 
	end

	def new
		@competency = Competency.new
	end

	def create
		@competency = Competency.new(competency_params)
		if @competency.save
			flash[:notice] = "Competency created successfully."
			redirect_to(:controller => 'competencies', :action => 'index')
		else
			render('new')
		end
	end

	def edit
	end

	def update		
		if @competency.update_attributes(competency_params)
			flash[:notice] = "Competency updated successfully."

			redirect_to(:action => 'show', :id => @competency.id)
		else
			render('edit')
		end
	end

	def delete
	end

	def destroy
		@competency.destroy
		@learnmoments = LearnMoment.where(:competency_id => @competency.id)

		@learnmoments.each do |learnmoment| 
			learnmoment.destroy
		end

		@learning_goals = LearningGoal.where(:competency_id => @competency.id)

		@learning_goals.each do |learning_goal|
			learning_goal.destroy
		end 

		flash[:notice] = "Competency destroyed successfully"
    redirect_to(:action => 'index', :user_id => current_user.id)
	end

	def create_learning_goal 
		@learning_goal = LearningGoal.new(learning_params)
		if @learning_goal.save
			flash[:notice] = "Learning Goal is added"
			redirect_to(:action => 'show', :id => @learning_goal.competency_id)
		else
			flash[:notice_fail] = "Please describe your learning goal"
			redirect_to(:action => 'show', :id => @learning_goal.competency_id)
		end
	end

	private

		def learning_params
			params.require(:learning_goal).permit(:goal, :goal_made, :competency_id)
		end

		def competency_params
			params.require(:competency).permit(:title, :added, :points, :user_id, :expertise)
		end

		def set_competency 
			@competency = Competency.find(params[:id])
		end

		def title_select_options_array
			@title_select_options = [
				'Research & Innovation',
				'Concepting',
				'Multimedia Design',
				'Multimedia Production',
				'Quality Monitoring & Implementation',
				'Multidisciplinary Teamwork',
				'Communication',
				'Project Management',
				'Sharing',
				'Growth & Reflection'
			]
		end

		def expertise_select_options_array
			@expertise_select_options = [
				'Basic',
				'Advanced',
				'Expert'
			]
		end

end














