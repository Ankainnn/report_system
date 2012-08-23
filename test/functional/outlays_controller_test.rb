require 'test_helper'

class OutlaysControllerTest < ActionController::TestCase
  setup do
    @outlay = outlays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outlays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create outlay" do
    assert_difference('Outlay.count') do
      post :create, outlay: @outlay.attributes
    end

    assert_redirected_to outlay_path(assigns(:outlay))
  end

  test "should show outlay" do
    get :show, id: @outlay
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @outlay
    assert_response :success
  end

  test "should update outlay" do
    put :update, id: @outlay, outlay: @outlay.attributes
    assert_redirected_to outlay_path(assigns(:outlay))
  end

  test "should destroy outlay" do
    assert_difference('Outlay.count', -1) do
      delete :destroy, id: @outlay
    end

    assert_redirected_to outlays_path
  end
end
