require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_index_url
    assert_response :success
  end

  test "should get school" do
    get dashboard_school_url
    assert_response :success
  end

  test "should get teacher" do
    get dashboard_teacher_url
    assert_response :success
  end
end
