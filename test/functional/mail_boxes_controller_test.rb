require 'test_helper'

class MailBoxesControllerTest < ActionController::TestCase
  setup do
    @mail_box = mail_boxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mail_boxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mail_box" do
    assert_difference('MailBox.count') do
      post :create, mail_box: @mail_box.attributes
    end

    assert_redirected_to mail_box_path(assigns(:mail_box))
  end

  test "should show mail_box" do
    get :show, id: @mail_box
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mail_box
    assert_response :success
  end

  test "should update mail_box" do
    put :update, id: @mail_box, mail_box: @mail_box.attributes
    assert_redirected_to mail_box_path(assigns(:mail_box))
  end

  test "should destroy mail_box" do
    assert_difference('MailBox.count', -1) do
      delete :destroy, id: @mail_box
    end

    assert_redirected_to mail_boxes_path
  end
end
