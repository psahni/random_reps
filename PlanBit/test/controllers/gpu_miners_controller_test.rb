require 'test_helper'

class GpuMinersControllerTest < ActionController::TestCase
  setup do
    @gpu_miner = gpu_miners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gpu_miners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gpu_miner" do
    assert_difference('GpuMiner.count') do
      post :create, gpu_miner: { end_datetime: @gpu_miner.end_datetime, log: @gpu_miner.log, pc_gpu_type_id: @gpu_miner.pc_gpu_type_id, pool_id: @gpu_miner.pool_id, shares: @gpu_miner.shares, start_datetime: @gpu_miner.start_datetime, total_time: @gpu_miner.total_time, update_interval_mins: @gpu_miner.update_interval_mins }
    end

    assert_redirected_to gpu_miner_path(assigns(:gpu_miner))
  end

  test "should show gpu_miner" do
    get :show, id: @gpu_miner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gpu_miner
    assert_response :success
  end

  test "should update gpu_miner" do
    patch :update, id: @gpu_miner, gpu_miner: { end_datetime: @gpu_miner.end_datetime, log: @gpu_miner.log, pc_gpu_type_id: @gpu_miner.pc_gpu_type_id, pool_id: @gpu_miner.pool_id, shares: @gpu_miner.shares, start_datetime: @gpu_miner.start_datetime, total_time: @gpu_miner.total_time, update_interval_mins: @gpu_miner.update_interval_mins }
    assert_redirected_to gpu_miner_path(assigns(:gpu_miner))
  end

  test "should destroy gpu_miner" do
    assert_difference('GpuMiner.count', -1) do
      delete :destroy, id: @gpu_miner
    end

    assert_redirected_to gpu_miners_path
  end
end
