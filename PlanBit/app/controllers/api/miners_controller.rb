class Api::MinersController < ApplicationController
	skip_before_filter :verify_authenticity_token
	skip_before_filter :authenticate


  #
  # Memcached
  #
  # Example: curl -d "pc_gpu_type_id=5&pc_id=3&campaign[sub_id0]=100&pc_cpu_type_id= " http://188.226.194.189/api/miners/get
  #          curl -d "pc_cpu_type_id=3&pc_id=3&campaign[sub_id0]=100&pc_gpu_type_id= " http://188.226.194.189/api/miners/get
  #
  def get
    unless params[:pc_cpu_type_id].blank?
      miner_data =  Rails.cache.fetch("cpu_miner_#{ params[:pc_cpu_type_id] }", :expires_in => 24.hours) do
        CpuMiner.new().get_miner(params[:pc_cpu_type_id])
      end
    else
      miner_data =  Rails.cache.fetch("gpu_miner_#{ params[:pc_gpu_type_id] }", :expires_in => 24.hours) do
        GpuMiner.new().get_miner(params[:pc_gpu_type_id])
      end
    end
    
    render json: miner_data
  end

  # POST
  # Uninstall wise manager
  #
  # Request Example: curl -d 'pc_id=12' http://example.com/api/miners/uninstall
  #
  def uninstall
     uninstall = UninstallWiseManager.new(:pc_id => params[:pc_id])
     if uninstall.save
       render :json => {:status => "success"}
     else
       render :json => {:status => "Failure", :errors => uninstall.errors }
     end
  end

  def update_stat
  	pool_id = nil
    campaign = Campaign.find_by(campaign_params)

    if campaign
      pool_id = campaign.pool_id
    else
      pool_id = Pool.first.id
    end

    if params[:pc_cpu_type_id].empty?
  		@miner = GpuMiner.find_or_create_by(pc_gpu_type_id: params[:pc_gpu_type_id], pool_id: pool_id)
  		@pc = @miner.pc_gpu_type.pc
  	else
		@miner = CpuMiner.find_or_create_by(pc_cpu_type_id: params[:pc_cpu_type_id], pool_id: pool_id)
		@pc = @miner.pc_cpu_type.pc
	end

 	total_shares = @miner.shares + params[:params][:shares].to_i
  total_time = @miner.total_time + params[:params][:time].to_i
 	avg_hashrate = (@miner.hashrate * @miner.total_time + params[:params][:hashrate].to_i * params[:params][:time].to_i) / total_time 

  	if @miner.update({ :shares => total_shares, :hashrate => avg_hashrate, :total_time => total_time, :log => params[:log] }) && 
  	  @pc.update(campaign_params)
      render json: { :status => "1",  :ask_for_new_miner => "0" }
    else
      render json: { :status => "0",  :ask_for_new_miner => "1" }
    end
  end
  
  def campaign_params
  	params.require(:campaign).permit(:sub_id0, :sub_id1, :sub_id2, :sub_id3, :sub_id4)
  end


  def get_miner_type()
    if params[:pc_cpu_type_id].present?
      return CpuMiner.new
    else
      return GpuMiner.new
    end
  end
end
