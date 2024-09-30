require "application_system_test_case"

class NuevosTest < ApplicationSystemTestCase
  setup do
    @nuevo = nuevos(:one)
  end

  test "visiting the index" do
    visit nuevos_url
    assert_selector "h1", text: "Nuevos"
  end

  test "should create nuevo" do
    visit nuevos_url
    click_on "New nuevo"

    fill_in "Description", with: @nuevo.description
    fill_in "Username", with: @nuevo.username
    click_on "Create Nuevo"

    assert_text "Nuevo was successfully created"
    click_on "Back"
  end

  test "should update Nuevo" do
    visit nuevo_url(@nuevo)
    click_on "Edit this nuevo", match: :first

    fill_in "Description", with: @nuevo.description
    fill_in "Username", with: @nuevo.username
    click_on "Update Nuevo"

    assert_text "Nuevo was successfully updated"
    click_on "Back"
  end

  test "should destroy Nuevo" do
    visit nuevo_url(@nuevo)
    click_on "Destroy this nuevo", match: :first

    assert_text "Nuevo was successfully destroyed"
  end
end
