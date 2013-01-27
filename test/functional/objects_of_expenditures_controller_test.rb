require 'test_helper'

class ObjectsOfExpendituresControllerTest < ActionController::TestCase
  setup do
    @objects_of_expenditure = objects_of_expenditures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:objects_of_expenditures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create objects_of_expenditure" do
    assert_difference('ObjectsOfExpenditure.count') do
      post :create, objects_of_expenditure: @objects_of_expenditure.attributes
    end

    assert_redirected_to objects_of_expenditure_path(assigns(:objects_of_expenditure))
  end

  test "should show objects_of_expenditure" do
    get :show, id: @objects_of_expenditure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @objects_of_expenditure
    assert_response :success
  end

  test "should update objects_of_expenditure" do
    put :update, id: @objects_of_expenditure, objects_of_expenditure: @objects_of_expenditure.attributes
    assert_redirected_to objects_of_expenditure_path(assigns(:objects_of_expenditure))
  end

  test "should destroy objects_of_expenditure" do
    assert_difference('ObjectsOfExpenditure.count', -1) do
      delete :destroy, id: @objects_of_expenditure
    end

    assert_redirected_to objects_of_expenditures_path
  end
end
