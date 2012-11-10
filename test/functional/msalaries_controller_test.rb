require 'test_helper'

class MsalariesControllerTest < ActionController::TestCase
  setup do
    @msalary = msalaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:msalaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create msalary" do
    assert_difference('Msalary.count') do
      post :create, msalary: @msalary.attributes
    end

    assert_redirected_to msalary_path(assigns(:msalary))
  end

  test "should show msalary" do
    get :show, id: @msalary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @msalary
    assert_response :success
  end

  test "should update msalary" do
    put :update, id: @msalary, msalary: @msalary.attributes
    assert_redirected_to msalary_path(assigns(:msalary))
  end

  test "should destroy msalary" do
    assert_difference('Msalary.count', -1) do
      delete :destroy, id: @msalary
    end

    assert_redirected_to msalaries_path
  end
end
