require "rails_helper"

feature "Profile" do
  let!(:user) { create :user, :user }

  scenario "Logged as user" do
    login_as user
    visit root_path
    expect(page).not_to have_link("Profile")
  end
end
