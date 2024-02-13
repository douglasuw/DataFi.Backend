class DataSourcesController < ApplicationController
  before_action :set_data_source, only: %i[ show edit update destroy ]

  # GET /data_sources or /data_sources.json
  def index
    @data_sources = DataSource.all
  end

  # GET /data_sources/1 or /data_sources/1.json
  def show
  end

  # GET /data_sources/new
  def new
    @data_source = DataSource.new
  end

  # GET /data_sources/1/edit
  def edit
  end

  # POST /data_sources or /data_sources.json
  def create
    @data_source = DataSource.new(data_source_params)

    respond_to do |format|
      if @data_source.save
        format.html { redirect_to data_source_url(@data_source), notice: "Data source was successfully created." }
        format.json { render :show, status: :created, location: @data_source }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @data_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_sources/1 or /data_sources/1.json
  def update
    respond_to do |format|
      if @data_source.update(data_source_params)
        format.html { redirect_to data_source_url(@data_source), notice: "Data source was successfully updated." }
        format.json { render :show, status: :ok, location: @data_source }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @data_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_sources/1 or /data_sources/1.json
  def destroy
    @data_source.destroy

    respond_to do |format|
      format.html { redirect_to data_sources_url, notice: "Data source was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_source
      @data_source = DataSource.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def data_source_params
      params.require(:data_source).permit(:name, :description)
    end
end
