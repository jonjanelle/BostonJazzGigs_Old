require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get '/'
    assert_response :success
  end

  test "should get home 2" do
    get '/home'
    assert_response :success
  end

  


end
