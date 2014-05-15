class PoolTypesController < ApplicationController
  before_action :set_pool_type, only: [:show, :edit, :update, :destroy]

  # GET /pool_types
  # GET /pool_types.json
  def index
    @pool_types = PoolType.all
  end

  # GET /pool_types/1
  # GET /pool_types/1.json
  def show
  end

  # GET /pool_types/new
  def new
    @pool_type = PoolType.new
  end

  # GET /pool_types/1/edit
  def edit
  end

  # POST /pool_types
  # POST /pool_types.json
  def create
    @pool_type = PoolType.new(pool_type_params)

    respond_to do |format|
      if @pool_type.save
        format.html { redirect_to @pool_type, notice: 'Pool type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pool_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @pool_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pool_types/1
  # PATCH/PUT /pool_types/1.json
  def update
    respond_to do |format|
      if @pool_type.update(pool_type_params)
        format.html { redirect_to @pool_type, notice: 'Pool type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pool_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pool_types/1
  # DELETE /pool_types/1.json
  def destroy
    @pool_type.destroy
    respond_to do |format|
      format.html { redirect_to pool_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pool_type
      @pool_type = PoolType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pool_type_params
      params.require(:pool_type).permit(:id, :name, :algo)
    end
end
