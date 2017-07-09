require 'test_helper'

class TopicsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get topics_index_url
    assert_response :success
  end

  test "should get show" do
    get topics_show_url
    assert_response :success
  end

  test "should get new" do
    get topics_new_url
    assert_response :success
  end

  test "should get edit" do
    get topics_edit_url
    assert_response :success
  end

end
