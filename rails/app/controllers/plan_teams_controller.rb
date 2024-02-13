class PlanTeamsController < ApplicationController
  before_action :set_plan_team, only: %i[ show edit update destroy ]

  # GET /plan_teams or /plan_teams.json
  def index
    @plan_teams = PlanTeam.all
  end

  # GET /plan_teams/1 or /plan_teams/1.json
  def show
  end

  # GET /plan_teams/new
  def new
    @plan_team = PlanTeam.new
  end

  # GET /plan_teams/1/edit
  def edit
  end

  # POST /plan_teams or /plan_teams.json
  def create
    @plan_team = PlanTeam.new(plan_team_params)

    respond_to do |format|
      if @plan_team.save
        format.html { redirect_to plan_team_url(@plan_team), notice: "Plan team was successfully created." }
        format.json { render :show, status: :created, location: @plan_team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plan_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plan_teams/1 or /plan_teams/1.json
  def update
    respond_to do |format|
      if @plan_team.update(plan_team_params)
        format.html { redirect_to plan_team_url(@plan_team), notice: "Plan team was successfully updated." }
        format.json { render :show, status: :ok, location: @plan_team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plan_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plan_teams/1 or /plan_teams/1.json
  def destroy
    @plan_team.destroy

    respond_to do |format|
      format.html { redirect_to plan_teams_url, notice: "Plan team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan_team
      @plan_team = PlanTeam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plan_team_params
      params.require(:plan_team).permit(:user_id, :plans_id, :start_date, :end_date, :payment_method_id, :active, :value)
    end
end
