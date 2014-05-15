require 'test_helper'

class GpuConfsControllerTest < ActionController::TestCase
  setup do
    @gpu_conf = gpu_confs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gpu_confs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gpu_conf" do
    assert_difference('GpuConf.count') do
      post :create, gpu_conf: { max_cpu: @gpu_conf.max_cpu, max_temp: @gpu_conf.max_temp, name: @gpu_conf.name, run_only_inactive: @gpu_conf.run_only_inactive }
    end

    assert_redirected_to gpu_conf_path(assigns(:gpu_conf))
  end

  test "should show gpu_conf" do
    get :show, id: @gpu_conf
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gpu_conf
    assert_response :success
  end

  test "should update gpu_conf" do
    patch :update, id: @gpu_conf, gpu_conf: { max_cpu: @gpu_conf.max_cpu, max_temp: @gpu_conf.max_temp, name: @gpu_conf.name, run_only_inactive: @gpu_conf.run_only_inactive }
    assert_redirected_to gpu_conf_path(assigns(:gpu_conf))
  end

  test "should destroy gpu_conf" do
    assert_difference('GpuConf.count', -1) do
      delete :destroy, id: @gpu_conf
    end

    assert_redirected_to gpu_confs_path
  end
end
