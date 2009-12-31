require 'test_helper'

class DinnersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dinners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dinner" do
    assert_difference('Dinner.count') do
      post :create, :dinner => { }
    end

    assert_redirected_to dinner_path(assigns(:dinner))
  end

  test "should show dinner" do
    get :show, :id => dinners(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => dinners(:one).to_param
    assert_response :success
  end

  test "should update dinner" do
    put :update, :id => dinners(:one).to_param, :dinner => { }
    assert_redirected_to dinner_path(assigns(:dinner))
  end

  test "should destroy dinner" do
    assert_difference('Dinner.count', -1) do
      delete :destroy, :id => dinners(:one).to_param
    end

    assert_redirected_to dinners_path
  end
end
