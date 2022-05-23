require "application_system_test_case"

class TransactsTest < ApplicationSystemTestCase
  setup do
    @transact = transacts(:one)
  end

  test "visiting the index" do
    visit transacts_url
    assert_selector "h1", text: "Transacts"
  end

  test "should create transact" do
    visit transacts_url
    click_on "New transact"

    fill_in "Amount", with: @transact.amount
    fill_in "Categories", with: @transact.categories
    fill_in "Category", with: @transact.category_id
    fill_in "Name", with: @transact.name
    click_on "Create Transact"

    assert_text "Transact was successfully created"
    click_on "Back"
  end

  test "should update Transact" do
    visit transact_url(@transact)
    click_on "Edit this transact", match: :first

    fill_in "Amount", with: @transact.amount
    fill_in "Categories", with: @transact.categories
    fill_in "Category", with: @transact.category_id
    fill_in "Name", with: @transact.name
    click_on "Update Transact"

    assert_text "Transact was successfully updated"
    click_on "Back"
  end

  test "should destroy Transact" do
    visit transact_url(@transact)
    click_on "Destroy this transact", match: :first

    assert_text "Transact was successfully destroyed"
  end
end
