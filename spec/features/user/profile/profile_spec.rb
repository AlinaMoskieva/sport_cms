require "rails_helper"

feature "Profile" do
  let!(:user) { create :user, :user }

  context "Logged as user" do
    it "has link" do
      login_as user
      visit root_path
      expect(page).not_to have_link("Profile")
    end
  end
end
