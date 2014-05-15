require 'test_helper'

class GpuTypesControllerTest < ActionController::TestCase
  setup do
    @gpu_type = gpu_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gpu_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gpu_type" do
    assert_difference('GpuType.count') do
      post :create, gpu_type: { core_amount: @gpu_type.core_amount, processor: @gpu_type.processor }
    end

    assert_redirected_to gpu_type_path(assigns(:gpu_type))
  end

  test "should show gpu_type" do
    get :show, id: @gpu_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gpu_type
    assert_response :success
  end

  test "should update gpu_type" do
    patch :update, id: @gpu_type, gpu_type: { core_amount: @gpu_type.core_amount, processor: @gpu_type.processor }
    assert_redirected_to gpu_type_path(assigns(:gpu_type))
  end

  test "should destroy gpu_type" do
    assert_difference('GpuType.count', -1) do
      delete :destroy, id: @gpu_type
    end

    assert_redirected_to gpu_types_path
  end
end
