require 'test_helper'


#Goal: Verify that invalid login flash message persists for only one page
class UsersLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: {session: { email: "blah@blah.blah ", password: "sadfsadf" } } #should be invalid, redirect back to new
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end
