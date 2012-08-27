require 'test_helper'

class SwitchesControllerTest < ActionController::TestCase
  setup do
    @switch = switches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:switches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create switch" do
    assert_difference('Switch.count') do
      post :create, :switch => { :env => @switch.env, :hostname => @switch.hostname, :int_vlan_10_ip => @switch.int_vlan_10_ip, :lb_ip => @switch.lb_ip, :mac_add => @switch.mac_add, :model => @switch.model, :next-hop_ip_1 => @switch.next-hop_ip_1, :next-hop_ip_2 => @switch.next-hop_ip_2, :rack => @switch.rack, :row => @switch.row, :uplink_1_ip => @switch.uplink_1_ip, :uplink_2_ip => @switch.uplink_2_ip, :vendor => @switch.vendor }
    end

    assert_redirected_to switch_path(assigns(:switch))
  end

  test "should show switch" do
    get :show, :id => @switch
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @switch
    assert_response :success
  end

  test "should update switch" do
    put :update, :id => @switch, :switch => { :env => @switch.env, :hostname => @switch.hostname, :int_vlan_10_ip => @switch.int_vlan_10_ip, :lb_ip => @switch.lb_ip, :mac_add => @switch.mac_add, :model => @switch.model, :next-hop_ip_1 => @switch.next-hop_ip_1, :next-hop_ip_2 => @switch.next-hop_ip_2, :rack => @switch.rack, :row => @switch.row, :uplink_1_ip => @switch.uplink_1_ip, :uplink_2_ip => @switch.uplink_2_ip, :vendor => @switch.vendor }
    assert_redirected_to switch_path(assigns(:switch))
  end

  test "should destroy switch" do
    assert_difference('Switch.count', -1) do
      delete :destroy, :id => @switch
    end

    assert_redirected_to switches_path
  end
end
