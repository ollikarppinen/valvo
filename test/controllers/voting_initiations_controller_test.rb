require 'test_helper'

class VotingStartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @voting_start = voting_starts(:one)
  end

  test "should get index" do
    get voting_starts_url
    assert_response :success
  end

  test "should get new" do
    get new_voting_start_url
    assert_response :success
  end

  test "should create voting_start" do
    assert_difference('VotingStart.count') do
      post voting_starts_url, params: { voting_start: {  } }
    end

    assert_redirected_to voting_start_url(VotingStart.last)
  end

  test "should show voting_start" do
    get voting_start_url(@voting_start)
    assert_response :success
  end

  test "should get edit" do
    get edit_voting_start_url(@voting_start)
    assert_response :success
  end

  test "should update voting_start" do
    patch voting_start_url(@voting_start), params: { voting_start: {  } }
    assert_redirected_to voting_start_url(@voting_start)
  end

  test "should destroy voting_start" do
    assert_difference('VotingStart.count', -1) do
      delete voting_start_url(@voting_start)
    end

    assert_redirected_to voting_starts_url
  end
end
