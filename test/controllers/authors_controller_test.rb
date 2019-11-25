require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get authors_new_url
    assert_response :success
  end

  test "should get create" do
    get authors_create_url
    assert_response :success
  end

end
