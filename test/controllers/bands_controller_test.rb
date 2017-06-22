require 'test_helper'

class BandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bands_url
    assert_response :success
  end

  test "should get new" do
    get new_band_url
    assert_response :success
  end

  test "should get create" do
    assert_difference('Band.count',1)
    post bands_url, params: { band: {description: @band.description,
                                     email: @band.email,
                                     name: @band.name,
                                     genre: @band.genre}}
    assert_redirected_to musician_url(Band.last)
  end

  test "should get edit" do
    get edit_band_url(@band)
    assert_response :success
  end

  test "should update band" do
    patch band_url(@band), params: {id: @band.id,
                                    band: {description: @band.description,
                                    email: @band.email,
                                    name: @band.name,
                                    genre: @band.genre}}
    assert_redirected_to band_url(@band)
  end

  test "should destroy band" do
    assert_difference('Band.count',-1) do
      delete band_url(@band), params: { id: @band.id }
    end
    assert_redirected_to bands_url
  end

end
