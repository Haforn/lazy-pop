class LearnMomentsController < ApplicationController
  
	layout 'application'

	before_action :find_competency

  def show
    @learnmoment = LearnMoment.find(params[:id])
    @hours_spend = ['0.30', '1', 
                    '1.30', '2', 
                    '2.30', '3', 
                    '3.30', '4',
                    '4.30', '5', 
                    '5.30', '6', 
                    '6.30', '7', 
                    '7.30', '8']
  
    @learnmoment_updated_at = @learnmoment.updated_at.strftime "%d/%m/%Y %H:%M"
  end

  def new
    @learnmoment = LearnMoment.new
  end

  def create
    @learnmoment = LearnMoment.new(learn_moments_params)
    if @learnmoment.save
      flash[:notice] = "Learn moment created successfully."
      redirect_to(:controller => 'competencies', :action => 'index', :user_id => @competency.user_id)
    else
      render('new')
    end 
  end

  def edit
    @learnmoment = LearnMoment.find(params[:id])
  end

  def update
    @learnmoment = LearnMoment.find(params[:id])
    if @learnmoment.update_attributes(learn_moments_params)
      flash[:notice] = "Learn moment updated successfully."
      redirect_to(:action => 'show', :id => @learnmoment.id, :competency_id => @learnmoment.competency_id)
    else
      flash[:notice_fail] = "Please fill out the learn moment"
      render('edit')
    end
  end

  def delete
    @learnmoment = LearnMoment.find(params[:id])
  end

  def destroy
    @learnmoment = LearnMoment.find(params[:id]).destroy
    flash[:notice] = "Learn moment successfully deleted"
    redirect_to(:controller => 'competencies', :action => 'index', :user_id => @competency.user_id)
  end

  private

  	def find_competency
  		@competency = Competency.find(params[:competency_id])
  	end

    def learn_moments_params
      params.require(:learnmoment).permit(:title, :what_was_learned, :what_was_done, :reference, :hours, :image, :competency_id)
    end
end
