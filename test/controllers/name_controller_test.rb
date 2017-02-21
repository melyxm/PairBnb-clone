require 'test_helper'

class NameControllerTest < ActionDispatch::IntegrationTest
  test "should get sessions" do
    get name_sessions_url
    assert_response :success
  end

end
