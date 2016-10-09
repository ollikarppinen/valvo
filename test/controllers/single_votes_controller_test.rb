require 'test_helper'

class VotingFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @voting_form = voting_forms(:one)
  end

  test "should get index" do
    get voting_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_voting_form_url
    assert_response :success
  end

  test "should create voting_form" do
    assert_difference('VotingForm.count') do
      post voting_forms_url, params: { voting_form: {  } }
    end

    assert_redirected_to voting_form_url(VotingForm.last)
  end

  test "should show voting_form" do
    get voting_form_url(@voting_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_voting_form_url(@voting_form)
    assert_response :success
  end

  test "should update voting_form" do
    patch voting_form_url(@voting_form), params: { voting_form: {  } }
    assert_redirected_to voting_form_url(@voting_form)
  end

  test "should destroy voting_form" do
    assert_difference('VotingForm.count', -1) do
      delete voting_form_url(@voting_form)
    end

    assert_redirected_to voting_forms_url
  end
end
