require 'test_helper'

class RsvpsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rsvps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rsvp" do
    assert_difference('Rsvp.count') do
      post :create, :rsvp => { }
    end

    assert_redirected_to rsvp_path(assigns(:rsvp))
  end

  test "should show rsvp" do
    get :show, :id => rsvps(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rsvps(:one).to_param
    assert_response :success
  end

  test "should update rsvp" do
    put :update, :id => rsvps(:one).to_param, :rsvp => { }
    assert_redirected_to rsvp_path(assigns(:rsvp))
  end

  test "should destroy rsvp" do
    assert_difference('Rsvp.count', -1) do
      delete :destroy, :id => rsvps(:one).to_param
    end

    assert_redirected_to rsvps_path
  end
end
