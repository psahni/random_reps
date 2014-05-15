class Api::PcsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  skip_before_filter :authenticate  
  
  
  def index
    @pcs = Pc.all
    respond_to do |format|
      format.json { render json: @pcs }
      format.xml { render xml: @pcs }
    end
  end

  def register
      @pc = Pc.find_or_create(pc_params) 
      @response = { :pc_id => @pc.id, :gpu => @pc.pc_gpu_types.map { |gpu| { :pc_gpu_type_id => gpu.id } }, \
                                        :cpu =>  { :pc_cpu_type_id => @pc.pc_cpu_types.first.id } }
      
      render json: @response, status: :created
  end
  
  private
    # Using a private method to encapsulate the permissible parameters is
    # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def pc_params
      params.require(:pc).permit(:mac, :computer_name, :os_ver, :system_type, :ram_size, :ip_address, :is_laptop, \
        gpu_types_attributes: [ :number, :name, :core_amount ], cpu_types_attributes: [ :processor, :core_amount ], \
        campaign: [:sub_id0, :sub_id1, :sub_id2, :sub_id3, :sub_id4])
    end

    

end
