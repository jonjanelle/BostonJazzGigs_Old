require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count',1) do #1 is the default, just being clear
      suffix = (@user.id+1).to_s
      post users_url, params: { user: {username: @user.username+suffix,
                                       email: @user.email+suffix,
                                       password: @user.password_digest,
                                       user_type: @user.user_type}}
    end
    if @user.user_type=='m'
      assert_redirected_to new_musician_url
    else
      assert_redirected_to users_url(User.last)
    end
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should destroy user" do
    assert_difference('User.count',-1) do
      delete user_url(@user)
    end
    assert_redirected_to home_url
  end


end
