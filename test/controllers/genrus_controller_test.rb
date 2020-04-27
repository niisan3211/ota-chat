require 'test_helper'

class GenrusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get genrus_index_url
    assert_response :success
  end

end
