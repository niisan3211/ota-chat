require 'test_helper'

class UsersGenrusControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get users_genrus_create_url
    assert_response :success
  end

  test "should get destroy" do
    get users_genrus_destroy_url
    assert_response :success
  end

end
