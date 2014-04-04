require 'spec_helper'

feature 'record a building owner', %q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
} do

#   ----Acceptance Criteria:----
# *I must specify a first name, last name, and email address
# *I can optionally specify a company name
# *If I do not specify the required information, I am presented with errors
# *If I specify the required information, the owner is recorded and I am redirected to enter another new owner


  scenario 'I must specify a first name, last name, email and optionally a comapny name' do
    owner_count = Owner.count
    visit new_owner_path

    fill_in "First name", with: "Keith"
    fill_in "Last name", with: "Webber"
    fill_in "Email", with: "MA@gmail.com"
    fill_in "Company", with: "WebCo"

    click_on "Create new owner"

    expect(page).to have_content("New owner created successfully")
    expect(Owner.count).to eq(owner_count + 1)
    expect(page).to have_content("Register a new Owner")

  end

  scenario "If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors" do
    owner_count = Owner.count
    visit new_owner_path

    fill_in "First name", with: "12212"
    fill_in "Last name", with: "the Terrible"
    fill_in "Email", with: ""
    fill_in "Company", with: "WebCo"

    click_on "Create new owner"
    expect(page).to have_content("Please enter a valid first name")
    expect(page).to have_content("Please enter a valid last name")
    expect(page).to have_content("can't be blank")
    expect(Owner.count).to eq(owner_count)
  end


end
