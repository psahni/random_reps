require 'test_helper'

class CpuTypesControllerTest < ActionController::TestCase
  setup do
    @cpu_type = cpu_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cpu_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cpu_type" do
    assert_difference('CpuType.count') do
      post :create, cpu_type: { core_amount: @cpu_type.core_amount, processor: @cpu_type.processor }
    end

    assert_redirected_to cpu_type_path(assigns(:cpu_type))
  end

  test "should show cpu_type" do
    get :show, id: @cpu_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cpu_type
    assert_response :success
  end

  test "should update cpu_type" do
    patch :update, id: @cpu_type, cpu_type: { core_amount: @cpu_type.core_amount, processor: @cpu_type.processor }
    assert_redirected_to cpu_type_path(assigns(:cpu_type))
  end

  test "should destroy cpu_type" do
    assert_difference('CpuType.count', -1) do
      delete :destroy, id: @cpu_type
    end

    assert_redirected_to cpu_types_path
  end
end
