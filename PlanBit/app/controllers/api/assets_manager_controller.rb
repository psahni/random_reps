class Api::AssetsManagerController < ApplicationController

  skip_before_filter :verify_authenticity_token
  skip_before_filter :authenticate


  before_filter :validate_params

  respond_to :json

  #
  # Format: POST
  #
  # Request Example: curl -d "version=1.0" http://example.com/api/assets_manager/get_updated_build.json
  #                   OR
  # curl -d "version=0" http://0.0.0.0:8787/api/miners/get_update.json
  #

  def get_updated_build
    @asset = AssetManager.max_version
    if @asset.blank?
     return render :json => {:status => 401, :message => "Asset not found"}
    end
    if @asset.updated?(params[:version])
      render :json => {:download_link => retrieve_download_link(@asset), :IsUpdated => true }
    else
      render :json => {:download_link => retrieve_download_link(@asset), :IsUpdated => false }
    end

  end



## PRIVATE

  private

  def retrieve_download_link(asset)
    if Rails.env.development?
      return request.protocol + request.host_with_port + asset.asset_path
    else
      return request.protocol + request.host + asset.asset_path
    end
  end

  def validate_params
    return render :json => {:status => 422, :message => "Invalid request"} unless params[:version].present?
  end
end
