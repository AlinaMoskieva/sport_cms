require "rails_helper"

feature "Destroy subscription" do
  let!(:category) { create :category }
  let!(:user) { create :user, :user }
  let!(:site_page) { create :page, category: category }
  let!(:subscription) { create :subscription, user: user, category: category }

  describe "Destroy" do
    before do
      login_as user
      visit page_path(site_page)
    end

    scenario "can Destroy subscription", js: true do
      expect(page).to have_link("Unsubscribe")
      click_link "Unsubscribe"
      expect(page).not_to have_link("Unsubscribe")
      # expect(page).to have_link("Unsubscribe")
      visit user_subscriptions_path(user)
      expect(page).not_to have_content(site_page.category.category)
    end
  end
end
