require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  # test "should get home" do
  #   get static_pages_home_url
  #   assert_response :success
  # end

  test 'should get home' do
    get root_path
    assert_response :success
  end

  

end
