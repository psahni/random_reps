class Api::MinersController < ApplicationController
	skip_before_filter :verify_authenticity_token
	skip_before_filter :authenticate

  def get
  	@miner = nil
  	@conf = nil
  	@max_usage = nil

  	if params[:pc_cpu_type_id].empty?
  				@miner = GpuMiner.includes(:pc_gpu_type, :pool, pool: :pool_type, pc_gpu_type: [:gpu_type, gpu_type: :gpu_conf] \
			).find_by_pc_gpu_type_id(params[:pc_gpu_type_id])

  		@conf = @miner.pc_gpu_type.gpu_type.gpu_conf
  		@max_usage = @conf.max_cpu
  	else
			@miner = CpuMiner.includes(:pc_cpu_type, :pool, pool: :pool_type, pc_cpu_type: [:cpu_type, cpu_type: :cpu_conf] \
				).find_by_pc_cpu_type_id(params[:pc_cpu_type_id])

			@conf = @miner.pc_cpu_type.cpu_type.cpu_conf
			@max_usage = @conf.max_gpu

		end

		@pool = @miner.pool
		@pool_type = @pool.pool_type

		@response = { :max_temp => @conf.max_temp,
	    :max_usage=>  @max_usage,
	    :run_only_inactive=>  @conf.run_only_inactive,
	    :pool_info => {
	        :hostname => @pool.hostname,
	        :port => @pool.port, 
	        :username => @pool.username,
	        :password => @pool.password,
	        :pool_type => {
	            :name => @pool_type.name,
	            :algo => @pool_type.algo
	        },
	    },
	    :update_interval_mins => @miner.update_interval_mins,
	    :send_log => @miner.log
 		}
    
    render json: @response
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
end
