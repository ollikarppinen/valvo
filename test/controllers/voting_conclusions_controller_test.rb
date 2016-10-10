require 'test_helper'

class VotingEndsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @voting_end = voting_ends(:one)
  end

  test "should get index" do
    get voting_ends_url
    assert_response :success
  end

  test "should get new" do
    get new_voting_end_url
    assert_response :success
  end

  test "should create voting_end" do
    assert_difference('VotingEnd.count') do
      post voting_ends_url, params: { voting_end: {  } }
    end

    assert_redirected_to voting_end_url(VotingEnd.last)
  end

  test "should show voting_end" do
    get voting_end_url(@voting_end)
    assert_response :success
  end

  test "should get edit" do
    get edit_voting_end_url(@voting_end)
    assert_response :success
  end

  test "should update voting_end" do
    patch voting_end_url(@voting_end), params: { voting_end: {  } }
    assert_redirected_to voting_end_url(@voting_end)
  end

  test "should destroy voting_end" do
    assert_difference('VotingEnd.count', -1) do
      delete voting_end_url(@voting_end)
    end

    assert_redirected_to voting_ends_url
  end
end
