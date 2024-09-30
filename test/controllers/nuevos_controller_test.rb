require "test_helper"

class NuevosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nuevo = nuevos(:one)
  end

  test "should get index" do
    get nuevos_url
    assert_response :success
  end

  test "should get new" do
    get new_nuevo_url
    assert_response :success
  end

  test "should create nuevo" do
    assert_difference("Nuevo.count") do
      post nuevos_url, params: { nuevo: { description: @nuevo.description, username: @nuevo.username } }
    end

    assert_redirected_to nuevo_url(Nuevo.last)
  end

  test "should show nuevo" do
    get nuevo_url(@nuevo)
    assert_response :success
  end

  test "should get edit" do
    get edit_nuevo_url(@nuevo)
    assert_response :success
  end

  test "should update nuevo" do
    patch nuevo_url(@nuevo), params: { nuevo: { description: @nuevo.description, username: @nuevo.username } }
    assert_redirected_to nuevo_url(@nuevo)
  end

  test "should destroy nuevo" do
    assert_difference("Nuevo.count", -1) do
      delete nuevo_url(@nuevo)
    end

    assert_redirected_to nuevos_url
  end
end
