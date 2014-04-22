class SurveysController < ApplicationController
  before_action :authenticate_user!, :set_survey, only: [:show, :edit, :update, :destroy, :answers, :respond, :responses]
  before_filter :authenticate_user!

  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all

  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
  end

  # GET /surveys/1/edit
  def edit
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(survey_params)

    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
        format.json { render action: 'show', status: :created, location: @survey }
      else
        format.html { render action: 'new' }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @survey }
      else
        format.html { render action: 'edit' }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to surveys_url }
      format.json { head :no_content }
    end
  end

  def answers
    @questions = @survey.questions
  end

  def respond
    set_survey
    @responded_answers = Response.where(user_id: current_user.id).pluck(:answer_id)
    if @responded_answers.include?(1)
      i=2
    end
    i=0
  end

  def responses
    questions = @survey.questions
    for qq in questions do
      for ans in qq.answers do
        Response.delete_all(answer_id: ans.id,user_id: current_user.id)
      end
    end
    if params.has_key? :answers_ids
      for feedback in params[:answers_ids] do
        resp = Response.new
        resp.user_id=current_user.id
        resp.answer_id=feedback
        if Response.where(answer_id: feedback, user_id: current_user.id).count == 0
          resp.save!
        end
      end
    end
    redirect_to '/user/preferences'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_survey
    @survey = Survey.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def survey_params
    params.require(:survey).permit(:name,
                                   :questions_attributes => [:id, :content, :_destroy,
                                                             :answers_attributes => [:id, :content, :_destroy, :image]])
  end
end
