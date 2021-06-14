require 'test_helper'

class AccommodationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get accommodations_new_url
    assert_response :success
  end

  test "should get edit" do
    get accommodations_edit_url
    assert_response :success
  end

  test "should get index" do
    get accommodations_index_url
    assert_response :success
  end

end
