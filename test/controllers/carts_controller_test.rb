require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get carts_index_url
    assert_response :success
  end

  test "should get show" do
    get carts_show_url
    assert_response :success
  end

  test "should get destroy" do
    get carts_destroy_url
    assert_response :success
  end

  test "should get add_quantity" do
    get carts_add_quantity_url
    assert_response :success
  end

  test "should get reduce_quantity" do
    get carts_reduce_quantity_url
    assert_response :success
  end
end
