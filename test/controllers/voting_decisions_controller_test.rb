require 'test_helper'

class VotingDecisionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @voting_decision = voting_decisions(:one)
  end

  test "should get index" do
    get voting_decisions_url
    assert_response :success
  end

  test "should get new" do
    get new_voting_decision_url
    assert_response :success
  end

  test "should create voting_decision" do
    assert_difference('VotingDecision.count') do
      post voting_decisions_url, params: { voting_decision: {  } }
    end

    assert_redirected_to voting_decision_url(VotingDecision.last)
  end

  test "should show voting_decision" do
    get voting_decision_url(@voting_decision)
    assert_response :success
  end

  test "should get edit" do
    get edit_voting_decision_url(@voting_decision)
    assert_response :success
  end

  test "should update voting_decision" do
    patch voting_decision_url(@voting_decision), params: { voting_decision: {  } }
    assert_redirected_to voting_decision_url(@voting_decision)
  end

  test "should destroy voting_decision" do
    assert_difference('VotingDecision.count', -1) do
      delete voting_decision_url(@voting_decision)
    end

    assert_redirected_to voting_decisions_url
  end
end
