require 'test_helper'

class SingleVotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @single_vote = single_votes(:one)
  end

  test "should get index" do
    get single_votes_url
    assert_response :success
  end

  test "should get new" do
    get new_single_vote_url
    assert_response :success
  end

  test "should create single_vote" do
    assert_difference('SingleVote.count') do
      post single_votes_url, params: { single_vote: {  } }
    end

    assert_redirected_to single_vote_url(SingleVote.last)
  end

  test "should show single_vote" do
    get single_vote_url(@single_vote)
    assert_response :success
  end

  test "should get edit" do
    get edit_single_vote_url(@single_vote)
    assert_response :success
  end

  test "should update single_vote" do
    patch single_vote_url(@single_vote), params: { single_vote: {  } }
    assert_redirected_to single_vote_url(@single_vote)
  end

  test "should destroy single_vote" do
    assert_difference('SingleVote.count', -1) do
      delete single_vote_url(@single_vote)
    end

    assert_redirected_to single_votes_url
  end
end
