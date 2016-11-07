require 'test_helper'

class KarigarsControllerTest < ActionController::TestCase
  setup do
    @karigar = karigars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:karigars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create karigar" do
    assert_difference('Karigar.count') do
      post :create, karigar: { address: @karigar.address, name: @karigar.name, phone: @karigar.phone }
    end

    assert_redirected_to karigar_path(assigns(:karigar))
  end

  test "should show karigar" do
    get :show, id: @karigar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @karigar
    assert_response :success
  end

  test "should update karigar" do
    patch :update, id: @karigar, karigar: { address: @karigar.address, name: @karigar.name, phone: @karigar.phone }
    assert_redirected_to karigar_path(assigns(:karigar))
  end

  test "should destroy karigar" do
    assert_difference('Karigar.count', -1) do
      delete :destroy, id: @karigar
    end

    assert_redirected_to karigars_path
  end
end
