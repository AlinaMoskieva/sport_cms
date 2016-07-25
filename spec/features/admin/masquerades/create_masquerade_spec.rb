require "rails_helper"

feature "Create masquerade" do
  let!(:admin_user) { create :user, :administrator }
  let!(:user) { create :user, :user }

  before do
    login_as admin_user
    visit admin_users_path
  end

  describe "#create" do
    it "exist link 'new session as ..'" do
      expect(page).to have_link("New session as #{ user.email}".truncate(29))
    end

    scenario "Create masquerade" do
      click_link "New session as #{user.email}".truncate(29)
      visit root_path
      expect(page).to have_content(user.full_name)
      expect(page).to have_link("Stop Masquerading")
    end
  end
end
