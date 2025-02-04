require "test_helper"

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    post session_path, params: { session: { email: users(:alex).email, password: "password" } }
    get dashboard_path
    assert_response :success
  end

end