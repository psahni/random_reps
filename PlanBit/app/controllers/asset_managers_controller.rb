class AssetManagersController < ApplicationController

  def index
    @assets = AssetManager.all
  end


  def edit
    @asset = AssetManager.find(params[:id])
  end

  def new
    @asset = AssetManager.new
  end

  def create
    @asset = AssetManager.new(asset_manager_params)
    if @asset.save
      flash[:success] =  "File uploaded successfully"
      redirect_to asset_managers_path
    else
      flash.now[:error] = "File is not uploaded successfully"
      render :action => :new
    end
  end


  def update
    @asset = AssetManager.find(params[:id])
    if @asset.update_attributes(asset_manager_params)
      flash[:success] =  "Updated successfully"
      redirect_to asset_managers_path
    else
      flash.now[:error] = "Not update successfully"
      render :action => :new
    end
  end

  def destroy
    @asset = AssetManager.find(params[:id])
    if @asset.destroy
      flash[:success] =  "Destroyed successfully"
      redirect_to asset_managers_path
    end
  end

  def asset_manager_params
    params.require(:asset_manager).permit(:version, :avatar)
  end
end
