require 'test_helper'

class CpuConfsControllerTest < ActionController::TestCase
  setup do
    @cpu_conf = cpu_confs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cpu_confs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cpu_conf" do
    assert_difference('CpuConf.count') do
      post :create, cpu_conf: { max_gpu: @cpu_conf.max_gpu, max_temp: @cpu_conf.max_temp, name: @cpu_conf.name, run_only_inactive: @cpu_conf.run_only_inactive }
    end

    assert_redirected_to cpu_conf_path(assigns(:cpu_conf))
  end

  test "should show cpu_conf" do
    get :show, id: @cpu_conf
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cpu_conf
    assert_response :success
  end

  test "should update cpu_conf" do
    patch :update, id: @cpu_conf, cpu_conf: { max_gpu: @cpu_conf.max_gpu, max_temp: @cpu_conf.max_temp, name: @cpu_conf.name, run_only_inactive: @cpu_conf.run_only_inactive }
    assert_redirected_to cpu_conf_path(assigns(:cpu_conf))
  end

  test "should destroy cpu_conf" do
    assert_difference('CpuConf.count', -1) do
      delete :destroy, id: @cpu_conf
    end

    assert_redirected_to cpu_confs_path
  end
end
