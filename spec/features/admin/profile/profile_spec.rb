require "rails_helper"

feature "Profile" do
  let!(:admin_user) { create :user, :administrator }
  let!(:admin_page) { create :page, user: admin_user }

  scenario "Logged and has content" do
    login_as admin_user
    visit profile_index_path
    expect(page).to have_link("Profile")
    expect(page).to have_content(admin_user.full_name)
    expect(page).to have_content(admin_user.pages.count)
  end
end
