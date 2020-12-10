class SurveysController < ApplicationController

    def new
        @survey = Survey.new 
    end
    
    def create
        @user = User.find(params[:user_id])
        @survey = user.survey.create(survey_params)
        if @survey.save
            redirect_to @survey
        else
            render 'new'
        end
    end

    def edit
        @survey = Survey.find(params[:id])
    end

    def update
        @survey = Survey.find(params[:id])

        if @survey.update(survey_params)
          redirect_to @survey
        else
          render 'edit'
        end
      end

    def destroy
        survey = Survey.find(params[:id])
        survey.destroy
        redirect_to surveys_path, notice: "Deleted Survey!"
    end

    def index
        @surveys = current_user.surveys
    end
    
    def show
        @survey = Survey.find(params[:id])
    end

    private
    def survey_params
        params.require(:survey).permit(:title, :questions, :user_id)
    end

end
