class CpuMinersController < ApplicationController
  before_action :set_cpu_miner, only: [:show, :edit, :update, :destroy]

  # GET /cpu_miners
  # GET /cpu_miners.json
  def index
    @cpu_miners = CpuMiner.page(params[:page]).per(CpuMiner::PER_PAGE)
  end

  # GET /cpu_miners/1
  # GET /cpu_miners/1.json
  def show
  end

  # GET /cpu_miners/new
  def new
    @cpu_miner = CpuMiner.new
  end

  # GET /cpu_miners/1/edit
  def edit
  end

  # POST /cpu_miners
  # POST /cpu_miners.json
  def create
    @cpu_miner = CpuMiner.new(cpu_miner_params)

    respond_to do |format|
      if @cpu_miner.save
        format.html { redirect_to @cpu_miner, notice: 'Cpu miner was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cpu_miner }
      else
        format.html { render action: 'new' }
        format.json { render json: @cpu_miner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cpu_miners/1
  # PATCH/PUT /cpu_miners/1.json
  def update
    respond_to do |format|
      if @cpu_miner.update(cpu_miner_params)
        format.html { redirect_to @cpu_miner, notice: 'Cpu miner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cpu_miner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cpu_miners/1
  # DELETE /cpu_miners/1.json
  def destroy
    @cpu_miner.destroy
    respond_to do |format|
      format.html { redirect_to cpu_miners_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cpu_miner
      @cpu_miner = CpuMiner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cpu_miner_params
      params.require(:cpu_miner).permit(:pc_cpu_type_id, :pool_id, :start_datetime, :end_datetime, :total_time, :shares, :log, :update_interval_mins)
    end
end
