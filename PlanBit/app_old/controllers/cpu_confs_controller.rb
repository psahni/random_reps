class CpuConfsController < ApplicationController
  before_action :set_cpu_conf, only: [:show, :edit, :update, :destroy]

  # GET /cpu_confs
  # GET /cpu_confs.json
  def index
    @cpu_confs = CpuConf.all
  end

  # GET /cpu_confs/1
  # GET /cpu_confs/1.json
  def show
  end

  # GET /cpu_confs/new
  def new
    @cpu_conf = CpuConf.new
  end

  # GET /cpu_confs/1/edit
  def edit
  end

  # POST /cpu_confs
  # POST /cpu_confs.json
  def create
    @cpu_conf = CpuConf.new(cpu_conf_params)

    respond_to do |format|
      if @cpu_conf.save
        format.html { redirect_to @cpu_conf, notice: 'Cpu conf was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cpu_conf }
      else
        format.html { render action: 'new' }
        format.json { render json: @cpu_conf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cpu_confs/1
  # PATCH/PUT /cpu_confs/1.json
  def update
    respond_to do |format|
      if @cpu_conf.update(cpu_conf_params)
        format.html { redirect_to @cpu_conf, notice: 'Cpu conf was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cpu_conf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cpu_confs/1
  # DELETE /cpu_confs/1.json
  def destroy
    @cpu_conf.destroy
    respond_to do |format|
      format.html { redirect_to cpu_confs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cpu_conf
      @cpu_conf = CpuConf.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cpu_conf_params
      params.require(:cpu_conf).permit(:name, :max_temp, :max_gpu, :run_only_inactive)
    end
end
