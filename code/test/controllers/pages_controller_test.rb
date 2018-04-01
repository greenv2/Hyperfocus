require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get new" do
    get pages_new_url
    assert_response :success
  end

  test "should get generate" do
    get pages_generate_url
    assert_response :success
  end

  test "should get download" do
    get pages_download_url
    assert_response :success
  end

end
