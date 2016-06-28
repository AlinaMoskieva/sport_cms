require "rails_helper"

feature "Profile" do
  let!(:admin_user) { create :user, :administrator }
  let!(:user) { create :user, :user }
  let!(:admin_page) { create :page, user: admin_user }

  context "Logged as administrator" do
    it "has content" do
      login_as admin_user
      visit profile_index_path
      expect(page).to have_link("Profile")
      expect(page).to have_content(admin_user.full_name)
      expect(page).to have_content(admin_user.pages.count)
    end
  end

  context "Logged as user" do
    it "has link" do
      login_as user
      visit root_path
      expect(page).not_to have_link("Profile")
    end
  end
end
