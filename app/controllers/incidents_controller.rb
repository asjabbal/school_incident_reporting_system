class IncidentsController < ApplicationController
  before_action :set_incident, only: [:show, :edit, :update, :destroy]

  # GET /incidents
  # GET /incidents.json
  def index
    @incidents = Incident.all
  end

  # GET /incidents/1
  # GET /incidents/1.json
  def show
  end

  # GET /incidents/new
  def new
    @incident = session[:incident].present? ? Incident.new(session[:incident]) : Incident.new
    @incident.save if session[:incident].present?
    @detailed_form = params[:ft] == "detail"
    session.delete(:incident)
  end

  # GET /incidents/1/edit
  def edit
  end

  # POST /incidents
  # POST /incidents.json
  def create
    @incident = Incident.new(incident_params)

    respond_to do |format|
      if @incident.save
        format.html { redirect_to @incident, notice: 'Incident was successfully created.' }
        format.json { render :show, status: :created, location: @incident }
      else
        session[:incident] = @incident
        to_url = params[:ft] == "detail" ? new_incident_path(ft: params[:ft]) : new_incident_path

        format.html { redirect_to to_url }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incidents/1
  # PATCH/PUT /incidents/1.json
  def update
    respond_to do |format|
      if @incident.update(incident_params)
        format.html { redirect_to @incident, notice: 'Incident was successfully updated.' }
        format.json { render :show, status: :ok, location: @incident }
      else
        format.html { render :edit }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidents/1
  # DELETE /incidents/1.json
  def destroy
    @incident.destroy
    respond_to do |format|
      format.html { redirect_to incidents_url, notice: 'Incident was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incident
      @incident = Incident.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incident_params
      correct_files_params

      params.require(:incident).permit(
        :suspect_info, :witness_info, :occurred_at, :description,
        incident_kinds_attributes: [:kind],
        user_detail_attributes: [:name, :contact_info, :role],
        incident_location_attributes: [:location, :other_location],
        incident_files_attributes: [:document]
      )
    end

    # a little hack to support multiple files upload by normal file field upload way
    def correct_files_params
      files_arr = params[:incident].try(:[], :incident_files_attributes).nil? ? [] : params[:incident][:incident_files_attributes]["0"][:document].dup
      for i in 0..files_arr.length-1
        params[:incident][:incident_files_attributes][i.to_s] ||= {}
        params[:incident][:incident_files_attributes][i.to_s][:document] = files_arr[i]
      end
    end
end
