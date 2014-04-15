class PreferencesController < ApplicationController
  before_action :authenticate_user!, :set_preference, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  authorize_resource decent_exposure: true
  # GET /preferences
  # GET /preferences.json
  def index
    if user_signed_in?
      @preferences = current_user.preferences.all
      @available_surveys = Survey.all
    else
      @preferences = []
    end
  end

  # GET /preferences/1
  # GET /preferences/1.json
  def show
  end

  # GET /preferences/new
  def new
    @preference = Preference.new
  end

  # GET /preferences/1/edit
  def edit

  end

  # POST /preferences
  # POST /preferences.json
  def create
    @preference = Preference.new(preference_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @preference.save
        format.html { redirect_to @preference, notice: 'Preference was successfully created.' }
        format.json { render :show, status: :created, location: @preference }
      else
        format.html { render :new }
        format.json { render json: @preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preferences/1
  # PATCH/PUT /preferences/1.json
  def update
    respond_to do |format|
      if @preference.update(preference_params)
        format.html { redirect_to @preference, notice: 'Preference was successfully updated.' }
        format.json { render :show, status: :ok, location: @preference }
      else
        format.html { render :edit }
        format.json { render json: @preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preferences/1
  # DELETE /preferences/1.json
  def destroy
    @preference.destroy
    respond_to do |format|
      format.html { redirect_to preferences_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_preference
    @preference = Preference.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def preference_params
    params.require(:preference).permit(:location)
  end
end
