require "test_helper"

class MiniprogramControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get miniprogram_index_url
    assert_response :success
  end
end
