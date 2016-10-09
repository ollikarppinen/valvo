require 'test_helper'

class VotingConclusionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @voting_conclusion = voting_conclusions(:one)
  end

  test "should get index" do
    get voting_conclusions_url
    assert_response :success
  end

  test "should get new" do
    get new_voting_conclusion_url
    assert_response :success
  end

  test "should create voting_conclusion" do
    assert_difference('VotingConclusion.count') do
      post voting_conclusions_url, params: { voting_conclusion: {  } }
    end

    assert_redirected_to voting_conclusion_url(VotingConclusion.last)
  end

  test "should show voting_conclusion" do
    get voting_conclusion_url(@voting_conclusion)
    assert_response :success
  end

  test "should get edit" do
    get edit_voting_conclusion_url(@voting_conclusion)
    assert_response :success
  end

  test "should update voting_conclusion" do
    patch voting_conclusion_url(@voting_conclusion), params: { voting_conclusion: {  } }
    assert_redirected_to voting_conclusion_url(@voting_conclusion)
  end

  test "should destroy voting_conclusion" do
    assert_difference('VotingConclusion.count', -1) do
      delete voting_conclusion_url(@voting_conclusion)
    end

    assert_redirected_to voting_conclusions_url
  end
end
