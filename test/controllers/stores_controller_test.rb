require 'test_helper'

class StoresControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @store = stores(:one)
    @user = users(:one)
    sign_in @user
  end

  #stores/index
  test "everyone should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stores)
  end

  #stores/new
  test "admins should get new" do
    @user.add_role :admin
    get :new
    assert_response :success
  end

  test "non admins should not get new" do
    @user.remove_role :admin
    assert_raise CanCan::AccessDenied do
      get :new
    end
  end

  #stores/create
  test "admins should be able create store" do
    @user.add_role :admin
    assert_difference('Store.count') do
      post :create, store: {adventure: @store.adventure, bargain: @store.bargain, busyness: @store.busyness, convenience: @store.convenience, description: @store.description, name: @store.name, noise: @store.noise, prices: @store.prices, website: @store.website}
    end
    assert_redirected_to store_path(assigns(:store))
  end

  test "non admins should not be able create store" do
    @user.remove_role :admin
    assert_raise CanCan::AccessDenied do
      post :create, store: {adventure: @store.adventure, bargain: @store.bargain, busyness: @store.busyness, convenience: @store.convenience, description: @store.description, name: @store.name, noise: @store.noise, prices: @store.prices, website: @store.website}
    end
  end

  #stores/show
  test "should show store always" do
    @user.add_role :admin
    get :show, id: @store
    assert_response :success

    @user.remove_role :admin
    get :show, id: @store
    assert_response :success
  end

  #stores/edit
  test "admin user should get edit" do
    @user.add_role :admin
    get :edit, id: @store
    assert_response :success
  end

  test "non admin user should not get edit" do
    @user.remove_role :admin
    assert_raise CanCan::AccessDenied do
      get :edit, id: @store
    end
  end


  test "admin user should update store" do
    @user.add_role :admin
    patch :update, id: @store, store: {adventure: @store.adventure, bargain: @store.bargain, busyness: @store.busyness, convenience: @store.convenience, description: @store.description, name: @store.name, noise: @store.noise, prices: @store.prices, website: @store.website}
    assert_redirected_to store_path(assigns(:store))
  end

  test "should destroy store" do
    @user.add_role :admin
    assert_difference('Store.count', -1) do
      delete :destroy, id: @store
    end
    assert_redirected_to stores_path
  end
end
