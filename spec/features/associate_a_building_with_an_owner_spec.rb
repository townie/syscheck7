require 'spec_helper'

feature 'associate a building with an owner', %q{
  As a real estate associate
  I want to correlate an owner with buildings
  So that I can refer back to pertinent information

} do

  #   ----Acceptance Criteria:----
  # *When recording a building, I want to optionally associate the building with its rightful owner.
  # *If I delete an owner, the owner and its primary key should no longer be associated with any properties.

  scenario "When recording a building, I want to optionally associate the building with its rightful owner" do

    Owner.create!({first_name: "Keith", last_name: "Webber", email: "ma@gmail.com"})
    visit new_building_path

    fill_in "Street Address", with: "4 Mystic st"
    fill_in "City", with: "Boston"
    fill_in "State", with: "MA"
    fill_in "Postal Code", with: "02129"
    select("Keith Webber", :from => "Owner")

    click_on "Create new Building"

    visit buildings_path

    expect(page).to have_content("Keith Webber")
    expect(page).to have_content("4 Mystic st")
    expect(Building.first.owner.full_name).to eq("Keith Webber")
  end

  scenario "If I delete an owner, the owner and its primary key should no longer be associated with any properties." do

    user = Owner.create!({first_name: "Keith", last_name: "Webber", email: "ma@gmail.com"})
    visit new_building_path

    fill_in "Street Address", with: "4 Mystic st"
    fill_in "City", with: "Boston"
    fill_in "State", with: "MA"
    fill_in "Postal Code", with: "02129"
    select("Keith Webber", :from => "Owner")

    click_on "Create new Building"

    visit owners_path

    expect(Building.last.owner_id).to eq(user.id)
    click_on "Destroy Keith"

    expect(Building.last.owner_id).to eq(nil)
  end

end
