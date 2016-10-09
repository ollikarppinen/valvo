require 'test_helper'

class VotingInitiationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @voting_initiation = voting_initiations(:one)
  end

  test "should get index" do
    get voting_initiations_url
    assert_response :success
  end

  test "should get new" do
    get new_voting_initiation_url
    assert_response :success
  end

  test "should create voting_initiation" do
    assert_difference('VotingInitiation.count') do
      post voting_initiations_url, params: { voting_initiation: {  } }
    end

    assert_redirected_to voting_initiation_url(VotingInitiation.last)
  end

  test "should show voting_initiation" do
    get voting_initiation_url(@voting_initiation)
    assert_response :success
  end

  test "should get edit" do
    get edit_voting_initiation_url(@voting_initiation)
    assert_response :success
  end

  test "should update voting_initiation" do
    patch voting_initiation_url(@voting_initiation), params: { voting_initiation: {  } }
    assert_redirected_to voting_initiation_url(@voting_initiation)
  end

  test "should destroy voting_initiation" do
    assert_difference('VotingInitiation.count', -1) do
      delete voting_initiation_url(@voting_initiation)
    end

    assert_redirected_to voting_initiations_url
  end
end
