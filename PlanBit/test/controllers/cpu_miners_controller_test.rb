require 'test_helper'

class CpuMinersControllerTest < ActionController::TestCase
  setup do
    @cpu_miner = cpu_miners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cpu_miners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cpu_miner" do
    assert_difference('CpuMiner.count') do
      post :create, cpu_miner: { end_datetime: @cpu_miner.end_datetime, log: @cpu_miner.log, pc_cpu_type_id: @cpu_miner.pc_cpu_type_id, pool_id: @cpu_miner.pool_id, shares: @cpu_miner.shares, start_datetime: @cpu_miner.start_datetime, total_time: @cpu_miner.total_time, update_interval_mins: @cpu_miner.update_interval_mins }
    end

    assert_redirected_to cpu_miner_path(assigns(:cpu_miner))
  end

  test "should show cpu_miner" do
    get :show, id: @cpu_miner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cpu_miner
    assert_response :success
  end

  test "should update cpu_miner" do
    patch :update, id: @cpu_miner, cpu_miner: { end_datetime: @cpu_miner.end_datetime, log: @cpu_miner.log, pc_cpu_type_id: @cpu_miner.pc_cpu_type_id, pool_id: @cpu_miner.pool_id, shares: @cpu_miner.shares, start_datetime: @cpu_miner.start_datetime, total_time: @cpu_miner.total_time, update_interval_mins: @cpu_miner.update_interval_mins }
    assert_redirected_to cpu_miner_path(assigns(:cpu_miner))
  end

  test "should destroy cpu_miner" do
    assert_difference('CpuMiner.count', -1) do
      delete :destroy, id: @cpu_miner
    end

    assert_redirected_to cpu_miners_path
  end
end
