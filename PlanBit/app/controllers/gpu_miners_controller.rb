class GpuMinersController < ApplicationController
  before_action :set_gpu_miner, only: [:show, :edit, :update, :destroy]

  # GET /gpu_miners
  # GET /gpu_miners.json
  def index
    @gpu_miners = GpuMiner.page(params[:page]).per(GpuMiner::PER_PAGE)
  end

  # GET /gpu_miners/1
  # GET /gpu_miners/1.json
  def show
  end

  # GET /gpu_miners/new
  def new
    @gpu_miner = GpuMiner.new
  end

  # GET /gpu_miners/1/edit
  def edit
  end

  # POST /gpu_miners
  # POST /gpu_miners.json
  def create
    @gpu_miner = GpuMiner.new(gpu_miner_params)

    respond_to do |format|
      if @gpu_miner.save
        format.html { redirect_to @gpu_miner, notice: 'Gpu miner was successfully created.' }
        format.json { render action: 'show', status: :created, location: @gpu_miner }
      else
        format.html { render action: 'new' }
        format.json { render json: @gpu_miner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gpu_miners/1
  # PATCH/PUT /gpu_miners/1.json
  def update
    respond_to do |format|
      if @gpu_miner.update(gpu_miner_params)
        format.html { redirect_to @gpu_miner, notice: 'Gpu miner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @gpu_miner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gpu_miners/1
  # DELETE /gpu_miners/1.json
  def destroy
    @gpu_miner.destroy
    respond_to do |format|
      format.html { redirect_to gpu_miners_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gpu_miner
      @gpu_miner = GpuMiner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gpu_miner_params
      params.require(:gpu_miner).permit(:pc_gpu_type_id, :pool_id, :start_datetime, :end_datetime, :total_time, :shares, :log, :update_interval_mins)
    end
end
