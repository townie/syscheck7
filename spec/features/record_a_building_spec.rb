require 'spec_helper'

feature 'record a building', %q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
} do

#   ----Acceptance Criteria:----

# *I must specify a street address, city, state, and postal code
# *Only US states can be specified
# *I can optionally specify a description of the building
# *If I enter all of the required information in the required format, the building is recorded.
# *If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
# *Upon successfully creating a building, I am redirected so that I can record another building.

  scenario 'I must specify a street address, city, state, and postal code' do
    building_count = Building.count
    visit new_building_path

    fill_in "Street Address", with: "4 Mystic st"
    fill_in "City", with: "Boston"
    fill_in "State", with: "MA"
    fill_in "Postal Code", with: "02129"

    click_on "Create new Building"

    expect(page).to have_content("New building created")
    expect(Building.count).to eq(building_count + 1)

    expect(page).to have_content("Register a new building")

  end

  scenario "If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors" do
    building_count = Building.count
    visit new_building_path

    fill_in "Street Address", with: "4 Mystic st"
    fill_in "City", with: "New York City"
    fill_in "State", with: "1337"
    fill_in "Postal Code", with: "no hacks"

    click_on "Create new Building"

    expect(page).to have_content("Two letter abreviations please")
    expect(page).to have_content("should be in the form 12345 or 12345-1234")
    expect(Building.count).to eq(building_count)
  end


end
