class CpuTypesController < ApplicationController
  before_action :set_cpu_type, only: [:show, :edit, :update, :destroy]

  # GET /cpu_types
  # GET /cpu_types.json
  def index
    @cpu_types = CpuType.page(params[:page]).per(CpuType::PER_PAGE)
  end

  # GET /cpu_types/1
  # GET /cpu_types/1.json
  def show
  end

  # GET /cpu_types/new
  def new
    @cpu_type = CpuType.new
  end

  # GET /cpu_types/1/edit
  def edit
  end

  # POST /cpu_types
  # POST /cpu_types.json
  def create
    @cpu_type = CpuType.new(cpu_type_params)

    respond_to do |format|
      if @cpu_type.save
        format.html { redirect_to @cpu_type, notice: 'Cpu type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cpu_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @cpu_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cpu_types/1
  # PATCH/PUT /cpu_types/1.json
  def update
    respond_to do |format|
      if @cpu_type.update(cpu_type_params)
        format.html { redirect_to @cpu_type, notice: 'Cpu type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cpu_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cpu_types/1
  # DELETE /cpu_types/1.json
  def destroy
    @cpu_type.destroy
    respond_to do |format|
      format.html { redirect_to cpu_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cpu_type
      @cpu_type = CpuType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cpu_type_params
      params.require(:cpu_type).permit(:processor, :core_amount, :cpu_conf_id)
    end
end
