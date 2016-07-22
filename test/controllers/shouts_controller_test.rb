require 'test_helper'

class ShoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get shouts_create_url
    assert_response :success
  end

end
