class GeneratePdfController < ApplicationController

  def show

    @competencies = Competency.where(:user_id => current_user.id, :added => true)

    @hours_spend = ['0.30', '1', 
                    '1.30', '2', 
                    '2.30', '3', 
                    '3.30', '4',
                    '4.30', '5', 
                    '5.30', '6', 
                    '6.30', '7', 
                    '7.30', '8']
    
    respond_to do |format|
      format.html
      current_user = User.find(current_user.id)
      format.pdf do
        render :pdf => "Pop", :template => 'generate_pdf/show.html.erb', :layout => 'layouts/generate_pdf.html.erb'
      end
    end 
    
  end

end

