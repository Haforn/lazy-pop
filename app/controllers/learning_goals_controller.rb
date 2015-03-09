class LearningGoalsController < ApplicationController
  
  layout 'application'

  before_action :find_competency

  def edit
  	@learning_goal = LearningGoal.find(params[:id])
  end

  def update
    @learning_goal = LearningGoal.find(params[:id])
    if @learning_goal.update_attributes(learning_params)
      flash[:notice] = "Learning Goal updated successfully."
      redirect_to(:controller => 'competencies', :action => 'show', :id => @learning_goal.competency_id, :user_id => @competency.user_id)
    else
      render('edit')
    end
  end

  def delete
  	@learning_goal = LearningGoal.find(params[:id])
  end

  def destroy
  	@learning_goal = LearningGoal.find(params[:id]).destroy
  	flash[:notice] = "Learning Goal succesfully deleted"
  	redirect_to(:controller => 'competencies', :action => 'show', :id => @competency.id, :user_id => @competency.user_id)
  end 

  private

  	def find_competency
  		@competency = Competency.find(params[:competency_id])
  	end

    def learning_params
      params.require(:learning_goal).permit(:goal, :goal_made, :competency_id)
    end

end
