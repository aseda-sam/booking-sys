require "application_system_test_case"

class ReservationsTest < ApplicationSystemTestCase
  setup do
    @reservation = reservations(:one)
  end

  test "visiting the index" do
    visit reservations_url
    assert_selector "h1", text: "Reservations"
  end

  test "creating a Reservation" do
    visit reservations_url
    click_on "New Reservation"

    fill_in "Activity", with: @reservation.activity
    fill_in "Group", with: @reservation.group
    fill_in "Person", with: @reservation.person
    fill_in "Phone", with: @reservation.phone
    fill_in "Reserve Date", with: @reservation.reserve_date
    fill_in "Status", with: @reservation.status
    fill_in "Time End", with: @reservation.time_end
    fill_in "Time Start", with: @reservation.time_start
    click_on "Create Reservation"

    assert_text "Reservation was successfully created"
    click_on "Back"
  end

  test "updating a Reservation" do
    visit reservations_url
    click_on "Edit", match: :first

    fill_in "Activity", with: @reservation.activity
    fill_in "Group", with: @reservation.group
    fill_in "Person", with: @reservation.person
    fill_in "Phone", with: @reservation.phone
    fill_in "Reserve Date", with: @reservation.reserve_date
    fill_in "Status", with: @reservation.status
    fill_in "Time End", with: @reservation.time_end
    fill_in "Time Start", with: @reservation.time_start
    click_on "Update Reservation"

    assert_text "Reservation was successfully updated"
    click_on "Back"
  end

  test "destroying a Reservation" do
    visit reservations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reservation was successfully destroyed"
  end
end
