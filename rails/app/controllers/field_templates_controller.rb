class FieldTemplatesController < ApplicationController
  before_action :set_field_template, only: %i[ show edit update destroy ]

  # GET /field_templates or /field_templates.json
  def index
    @field_templates = FieldTemplate.all
  end

  # GET /field_templates/1 or /field_templates/1.json
  def show
  end

  # GET /field_templates/new
  def new
    @field_template = FieldTemplate.new
  end

  # GET /field_templates/1/edit
  def edit
  end

  # POST /field_templates or /field_templates.json
  def create
    @field_template = FieldTemplate.new(field_template_params)

    respond_to do |format|
      if @field_template.save
        format.html { redirect_to field_template_url(@field_template), notice: "Field template was successfully created." }
        format.json { render :show, status: :created, location: @field_template }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @field_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /field_templates/1 or /field_templates/1.json
  def update
    respond_to do |format|
      if @field_template.update(field_template_params)
        format.html { redirect_to field_template_url(@field_template), notice: "Field template was successfully updated." }
        format.json { render :show, status: :ok, location: @field_template }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @field_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /field_templates/1 or /field_templates/1.json
  def destroy
    @field_template.destroy

    respond_to do |format|
      format.html { redirect_to field_templates_url, notice: "Field template was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_field_template
      @field_template = FieldTemplate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def field_template_params
      params.require(:field_template).permit(:name, :data, :data_source_id)
    end
end
