class GpuTypesController < ApplicationController
  before_action :set_gpu_type, only: [:show, :edit, :update, :destroy]

  # GET /gpu_types
  # GET /gpu_types.json
  def index
    @gpu_types = GpuType.all
  end

  # GET /gpu_types/1
  # GET /gpu_types/1.json
  def show
  end

  # GET /gpu_types/new
  def new
    @gpu_type = GpuType.new
  end

  # GET /gpu_types/1/edit
  def edit
  end

  # POST /gpu_types
  # POST /gpu_types.json
  def create
    @gpu_type = GpuType.new(gpu_type_params)

    respond_to do |format|
      if @gpu_type.save
        format.html { redirect_to @gpu_type, notice: 'Gpu type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @gpu_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @gpu_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gpu_types/1
  # PATCH/PUT /gpu_types/1.json
  def update
    respond_to do |format|
      if @gpu_type.update(gpu_type_params)
        format.html { redirect_to @gpu_type, notice: 'Gpu type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @gpu_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gpu_types/1
  # DELETE /gpu_types/1.json
  def destroy
    @gpu_type.destroy
    respond_to do |format|
      format.html { redirect_to gpu_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gpu_type
      @gpu_type = GpuType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gpu_type_params
      params.require(:gpu_type).permit(:processor, :core_amount)
    end
end
