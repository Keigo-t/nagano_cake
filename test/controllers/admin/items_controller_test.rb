require "test_helper"

class Admin::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_items_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_items_index_url
    assert_response :success
  end
end
