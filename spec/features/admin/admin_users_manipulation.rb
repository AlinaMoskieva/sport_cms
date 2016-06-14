require "rails_helper"

feature "Admin User Manipulation" do
  let!(:admin_user) { create :user, :administrator }
  let!(:user) { create :user, :user }

  before { login_as admin_user
            visit admin_users_path
          }

  describe "change user role" do
    it "change role" do
      click_link "Update"
      visit edit_admin_user_path(user)
      expect(page).to have_content("Edit #{user.email}")
      select "administrator", from: "user_role"
      click_button "Update"
      visit admin_users_path
      expect(page).to have_content("administrator", count: 2)
    end
  end

  describe "login_as another user" do
    it "logged as user" do
      click_link "New session as #{user.email}".slice(0..25)
      visit root_path
      expect(page).to have_content(user.email)
    end
  end
end
