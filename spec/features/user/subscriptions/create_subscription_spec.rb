require "rails_helper"

feature "Create subscription" do
  let!(:user) { create :user, :user }
  let!(:site_page) { create :page }

  describe "create" do
    before do
      login_as user
      visit page_path(site_page)
    end

    scenario "can create subscription", js: true do
      click_link "Subscribe"
      expect(page).not_to have_link("Subscribe")
      # expect(page).to have_link("Unsubscribe")
      visit user_subscriptions_path(user)
      expect(page).to have_content(site_page.category.category)
    end
  end
end
