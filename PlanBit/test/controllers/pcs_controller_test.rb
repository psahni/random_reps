require 'test_helper'

class PcsControllerTest < ActionController::TestCase
  setup do
    @pc = pcs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pcs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pc" do
    assert_difference('Pc.count') do
      post :create, pc: { computer_name: @pc.computer_name, ip_address: @pc.ip_address, is_laptop: @pc.is_laptop, mac: @pc.mac, os_ver: @pc.os_ver, ram_size: @pc.ram_size, sub_id0: @pc.sub_id0, sub_id1: @pc.sub_id1, sub_id2: @pc.sub_id2, sub_id3: @pc.sub_id3, sub_id4: @pc.sub_id4, system_type: @pc.system_type }
    end

    assert_redirected_to pc_path(assigns(:pc))
  end

  test "should show pc" do
    get :show, id: @pc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pc
    assert_response :success
  end

  test "should update pc" do
    patch :update, id: @pc, pc: { computer_name: @pc.computer_name, ip_address: @pc.ip_address, is_laptop: @pc.is_laptop, mac: @pc.mac, os_ver: @pc.os_ver, ram_size: @pc.ram_size, sub_id0: @pc.sub_id0, sub_id1: @pc.sub_id1, sub_id2: @pc.sub_id2, sub_id3: @pc.sub_id3, sub_id4: @pc.sub_id4, system_type: @pc.system_type }
    assert_redirected_to pc_path(assigns(:pc))
  end

  test "should destroy pc" do
    assert_difference('Pc.count', -1) do
      delete :destroy, id: @pc
    end

    assert_redirected_to pcs_path
  end
end
