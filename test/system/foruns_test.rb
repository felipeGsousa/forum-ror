require "application_system_test_case"

class ForunsTest < ApplicationSystemTestCase
  setup do
    @forun = foruns(:one)
  end

  test "visiting the index" do
    visit foruns_url
    assert_selector "h1", text: "Foruns"
  end

  test "should create forun" do
    visit foruns_url
    click_on "New forun"

    fill_in "Id owner", with: @forun.id_owner
    fill_in "Name", with: @forun.name
    fill_in "Topic", with: @forun.topic
    click_on "Create Forun"

    assert_text "Forun was successfully created"
    click_on "Back"
  end

  test "should update Forun" do
    visit forun_url(@forun)
    click_on "Edit this forun", match: :first

    fill_in "Id owner", with: @forun.id_owner
    fill_in "Name", with: @forun.name
    fill_in "Topic", with: @forun.topic
    click_on "Update Forun"

    assert_text "Forun was successfully updated"
    click_on "Back"
  end

  test "should destroy Forun" do
    visit forun_url(@forun)
    click_on "Destroy this forun", match: :first

    assert_text "Forun was successfully destroyed"
  end
end
