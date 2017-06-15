require 'test_helper'

class MusiciansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get musicians_index_url
    assert_response :success
  end

  test "should get new" do
    get musicians_new_url
    assert_response :success
  end

  test "should get edit" do
    get musicians_edit_url
    assert_response :success
  end

end
