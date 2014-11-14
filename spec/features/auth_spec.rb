require 'rails_helper'
require 'capybara/rails'

feature 'Auth' do

  scenario 'Users can login and out' do
    create_user email: "user@example.com"

    visit root_path
    within(".signin-form") { click_on "Login" }
    expect(page).to have_content("Username / password is invalid")

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    within(".signin-form") { click_on "Login" }
    expect(page).to have_content("user@example.com")
  end

  scenario 'Users register without email' do
    visit root_path
    within(".auth") { click_on "Register" }
    fill_in "Name", with: "Scooby"
    fill_in "Password", with: "password"
    fill_in "Confirm", with: "password"
    within(".registration-form") { click_on "Register" }
    expect(page). to have_content("Email can't be blank")
  end
end
