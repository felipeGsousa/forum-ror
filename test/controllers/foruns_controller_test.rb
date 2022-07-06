require "test_helper"

class ForunsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forun = foruns(:one)
  end

  test "should get index" do
    get foruns_url
    assert_response :success
  end

  test "should get new" do
    get new_forun_url
    assert_response :success
  end

  test "should create forun" do
    assert_difference("Forun.count") do
      post foruns_url, params: { forun: { id_owner: @forun.id_owner, name: @forun.name, topic: @forun.topic } }
    end

    assert_redirected_to forun_url(Forun.last)
  end

  test "should show forun" do
    get forun_url(@forun)
    assert_response :success
  end

  test "should get edit" do
    get edit_forun_url(@forun)
    assert_response :success
  end

  test "should update forun" do
    patch forun_url(@forun), params: { forun: { id_owner: @forun.id_owner, name: @forun.name, topic: @forun.topic } }
    assert_redirected_to forun_url(@forun)
  end

  test "should destroy forun" do
    assert_difference("Forun.count", -1) do
      delete forun_url(@forun)
    end

    assert_redirected_to foruns_url
  end
end
