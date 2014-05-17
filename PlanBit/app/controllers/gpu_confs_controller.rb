class GpuConfsController < ApplicationController
  before_action :set_gpu_conf, only: [:show, :edit, :update, :destroy]

  # GET /gpu_confs
  # GET /gpu_confs.json
  def index
    @gpu_confs = GpuConf.page(params[:page]).per(GpuConf::PER_PAGE)
  end

  # GET /gpu_confs/1
  # GET /gpu_confs/1.json
  def show
  end

  # GET /gpu_confs/new
  def new
    @gpu_conf = GpuConf.new
  end

  # GET /gpu_confs/1/edit
  def edit
  end

  # POST /gpu_confs
  # POST /gpu_confs.json
  def create
    @gpu_conf = GpuConf.new(gpu_conf_params)

    respond_to do |format|
      if @gpu_conf.save
        format.html { redirect_to @gpu_conf, notice: 'Gpu conf was successfully created.' }
        format.json { render action: 'show', status: :created, location: @gpu_conf }
      else
        format.html { render action: 'new' }
        format.json { render json: @gpu_conf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gpu_confs/1
  # PATCH/PUT /gpu_confs/1.json
  def update
    respond_to do |format|
      if @gpu_conf.update(gpu_conf_params)
        format.html { redirect_to @gpu_conf, notice: 'Gpu conf was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @gpu_conf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gpu_confs/1
  # DELETE /gpu_confs/1.json
  def destroy
    @gpu_conf.destroy
    respond_to do |format|
      format.html { redirect_to gpu_confs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gpu_conf
      @gpu_conf = GpuConf.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gpu_conf_params
      params.require(:gpu_conf).permit(:name, :max_temp, :max_cpu, :run_only_inactive)
    end
end
